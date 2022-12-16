// useAge:
// var reqHttp = require("request_http");

// var options = {
// 	method: 'get', // default 'get'
// 	url: 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential',
// 	port: 443,	// if http default 80, if https default 443
//	headers: {
//		'Content-Type': 'text/xml'	// default 'application/x-www-form-urlencoded'
//	},
// 	data: {
// 		deviceId: 977748,
// 		deviceStatus: 'inGame'
// 	}
// };

// reqHttp(options, function (err, json) {
// 	if (err) {
// 		console.log(err);
// 	}
// 	console.log(json);
// });

const querystring = require('qs');
const https       = require('https');
const http        = require('http');
const url         = require('url');
const piXml       = require('pixl-xml');
const zlib        = require('zlib');
const tough       = require('tough-cookie');

var Cookie    = tough.Cookie;
var cookiejar = new tough.CookieJar();

var resDataParse = function (resData) {
	try {
		JSON.parse(resData);
	} catch(e) {
		try {
			piXml.parse(resData);
		} catch(e) {
			return resData;
		}
		return piXml.parse(resData);
	}
	return JSON.parse(resData);
};

var lineParse = function (context) {
	var result = context.replace(/\r\n/g, '\n');
	result = result.replace(/\r/g, '\n');

	return result.split('\n');
};

var redirectNext = function (protocol, reqOptions, callback, sendData, res) {
	if (!reqOptions.redirectChain) {
		return false;
	}
	if (res.statusCode != 301 && res.statusCode != 302 && res.statusCode != 303) {
		return false;
	}
	if (res.headers.location[0] == '/') {
		res.headers.location = `${reqOptions.urlParse.protocol}//${reqOptions.urlParse.host}${res.headers.location}`
	}
	var urlParse = url.parse(res.headers.location);
	reqOptions.urlParse = urlParse;
	reqOptions.hostname = urlParse.hostname;
	reqOptions.path     = urlParse.path;

	if (urlParse.protocol == 'http:') {
		reqOptions.port = urlParse.port || 80;
		protocol = http;
	}
	if (urlParse.protocol == 'https:') {
		reqOptions.port = urlParse.port || 443;
		protocol = https;
	}

	reqOptions.redirectChainCount++;

	if (reqOptions.redirectChainCount == reqOptions.redirectChainLimit) {
		console.error('Surpass redirectChainLimit');
		requestFn(protocol, reqOptions, callback, sendData);
		return false;
	}
	requestFn(protocol, reqOptions, callback, sendData);
	return true;
};

var gzipParse = function (res, callback) {
	if (res.headers['content-encoding'] != 'gzip') {
		return false;
	}

	var buffer = [];
	var gunzip = zlib.createGunzip();

	gunzip.on('data', function(data) {
		buffer.push(data.toString())
	}).on("end", function() {
		callback(null, buffer.join(""), res.headers, res.statusCode);

	}).on("error", function(e) {
		callback(e);
	});

	res.pipe(gunzip);
	return true;
};

var setHeaders = function (reqOptions, res) {
	if (!reqOptions.redirectChain) {
		return;
	}
	if (!res.headers['set-cookie']) {
		return;
	}
	if (res.headers['set-cookie'] instanceof Array)
		var cookies = res.headers['set-cookie'].map(Cookie.parse);
	else
		var cookies = [Cookie.parse(res.headers['set-cookie'])];
	cookies.forEach(cookie => {
		var cookieJson = cookie.toJSON();
		cookiejar.setCookieSync(cookie, `http://${cookieJson.domain}`);
	});
};

var requestFn = function (protocol, reqOptions, callback, sendData) {
	var json;
	var resData = '';
	var resObj = {
		data: '',
		ended: false
	};

	var linesSurplus = '';
	var err;

	var currentCookie = cookiejar.getCookiesSync(`http://${reqOptions.hostname}`);
	if (currentCookie.length != 0) {
		reqOptions.headers.Cookie = '';
		currentCookie.forEach(cookie => {
			var cookieJson = cookie.toJSON();
			reqOptions.headers.Cookie += `${cookieJson.key}=${cookieJson.value}; `
		});
	}
	var req = protocol.request(reqOptions, function (res) {
		setHeaders(reqOptions, res);

		if (redirectNext(protocol, reqOptions, callback, sendData, res)) {
			return;
		}

		if (gzipParse(res, callback)) {
			return;
		}

		res.headers.lastReqOptions = reqOptions;
		if (reqOptions.headersOnly) {
			callback(err, null, res.headers, res.statusCode);
			return;
		}

		res.on('data', function (chunk) {
			if (reqOptions.chunkMode) {
				resObj.data = chunk;
				callback(err, resObj, res.headers);
				resObj.data = '';
				return;
			}
			if (reqOptions.lineMode) {
				lineParseArr = lineParse(linesSurplus + chunk);
				for (var i = 0; i < lineParseArr.length - 1; i++) {
					resObj.data = lineParseArr[i];
					callback(err, resObj, res.headers);
					resObj.data = '';
				}
				linesSurplus = lineParseArr[lineParseArr.length - 1];
				return;
			}
			resData += chunk;
		});
		res.on('end', function () {
			resObj.ended = true;
			if (res.statusCode >= 400) {
				err = `REQUEST GET CODE ${res.statusCode}`;
				req.abort();
			}
			if (reqOptions.chunkMode) {
				callback(err, resObj, res.headers);
				return;
			}
			if (reqOptions.lineMode) {
				resObj.data = linesSurplus;
				callback(err, resObj, res.headers);
				return;
			}
			callback(err, resDataParse(resData), res.headers, res.statusCode);
		});
	});

	req.abortReason = '';

	req.on('error', function (err) {
		err.info = req.abortReason;
		callback(err);
	});

	req.on('timeout', function (err) {
		req.abortReason = `${new Date()}: REQUEST_TIMEOUT ${reqOptions.hostname} ${reqOptions.method} ${reqOptions.path}`;
		req.abort();
	});

	if (reqOptions.method.toLowerCase() == 'post' && sendData != null) {
		// write post data to request body
		req.write(sendData);
	}

	req.end();
};

var tryHttp = function (protocol, reqOptions, callback) {

	if (typeof reqOptions.data == 'object' && reqOptions.headers['Content-Type'] != 'application/octet-stream') {
		var sendData = querystring.stringify(reqOptions.data);
	} else {
		var sendData = reqOptions.data;
	}

	switch (reqOptions.method.toLowerCase()) {

		case 'get':

		var concatStr = '?';
		if (reqOptions.hasQuery) {
			concatStr = '&';
		}
		if (sendData != null) {
			reqOptions.path += concatStr + sendData;
		}
		reqOptions.method = 'GET';
		break;
		case 'post':

		reqOptions.method = 'POST';
		if (reqOptions.headers['Content-Type'] == 'application/json') {
			sendData = JSON.stringify(reqOptions.data);
		}
		break;

		default:
		break;
	}

	requestFn(protocol, reqOptions, callback, sendData);
};

var reqHttp = function (options, callback) {

	callback = callback || function () {};
	options.headers = options.headers || {};
	options.headers['Content-Type'] = options.headers['Content-Type'] || 'application/x-www-form-urlencoded';


	if (options.url == null) {
		callback('url is null');
		return;
	}

	var urlParse = url.parse(options.url);

	var reqOptions = {
		hostname: urlParse.hostname,
		path: urlParse.path,
		method: options.method || 'get',
		headers: options.headers,
		data: options.data,
		timeout: options.timeout || 60000,
		hasQuery: false,
		chunkMode: options.chunkMode || false,
		lineMode: options.lineMode || false,
		urlParse: urlParse,
		redirectChain: options.redirectChain || false,
		redirectChainLimit: options.redirectChainLimit || 10,
		redirectChainCount: options.redirectChainCount || 0,
		headersOnly: options.headersOnly || false
	};

	if (urlParse.query != null) {
		reqOptions.hasQuery = true;
	}
	if (urlParse.protocol == null) {
		callback('protocol is null');
		return;
	}
	if (urlParse.protocol == 'http:') {
		reqOptions.port = options.port || 80;
		protocol = http;
	}
	if (urlParse.protocol == 'https:') {
		reqOptions.port = options.port || 443;
		protocol = https;
	}
	if (urlParse.port != null) {
		reqOptions.port = urlParse.port;
	}

	tryHttp(protocol, reqOptions, callback);
};

module.exports = reqHttp;
