var reqHttp = require('../src/index.js');

// GET TEST
var options = {
	url: 'https://www.google.com',
	timeout: 5000
};

reqHttp(options, function (err, resBody, resHeaders, resCode) {
	if (err) {
		console.log(err);
		return;
	}
	console.log(resHeaders);
	console.log(resBody);
});

// POST TEST
var options = {
	method: 'post',
	url: 'https://www.google.com'
};

reqHttp(options, function (err, resBody, resHeaders, resCode) {
	if (err) {
		console.log(err);
		return;
	}
	console.log(resHeaders);
	console.log(resBody);
});

// POST DATA TEST
var options = {
	method: 'post',
	url: 'https://www.google.com',
	data: {
		a: 111,
		b: "2a2"
	}
};

reqHttp(options, function (err, resBody, resHeaders, resCode) {
	if (err) {
		console.log(err);
		return;
	}
	console.log(resHeaders);
	console.log(resBody);
});

// RESPONSE DATA CHUNK MODE
var options = {
	url: 'https://www.google.com/',
	chunkMode: true
};

var firstChunk = true;
reqHttp(options, function (err, chunkObj, resHeaders, resCode) {
	if (err) {
		console.log(err);
		return;
	}
	if (firstChunk) {
		console.log(resHeaders);
		firstChunk = false;
	}
	console.log(chunkObj);
	if (chunkObj.ended) {
		console.log("ALL DOCUMENT HAS READ COMLETED");
	}
});

// RESPONSE DATA LINE MODE
var options = {
	url: 'https://www.google.com/',
	lineMode: true
};

var firstLine = true;
reqHttp(options, function (err, lineObj, resHeaders, resCode) {
	if (err) {
		console.log(err);
		return;
	}
	if (firstLine) {
		console.log(resHeaders);
		firstLine = false;
	}
	console.log(lineObj);
	if (lineObj.ended) {
		console.log("ALL DOCUMENT HAS READ COMLETED");
	}
});

var options = {
	url: 'https://aweme.snssdk.com/aweme/v1/playwm/?video_id=v0200fg10000c7okggrc77uahmjtmce0&ratio=720p&line=0',
	timeout: 5000,
	redirectChain: true,
	headers: {
		'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'
	},
	headersOnly: true
};

reqHttp(options, function (err, resBody, resHeaders, resCode) {
	if (err) {
		console.log(err);
		return;
	}
	console.log(resHeaders);
	console.log(resBody);
});
