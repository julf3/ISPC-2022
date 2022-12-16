# request_http

## DESCRIPTION
`version`: `v3.0.0`
`author`: `Blind Holmes`

This is a simplified and powerful and Human-friendly HTTP request client.

## useAge:

request_http(**requestOptions**, **responseCallback**)

### responseCallback params
- err
	callback when http error.
- responseData
- responseheaders
- responseHttpCode

```
var reqHttp = require("request_http");

var options = {
	method: 'get', // default 'get'
	url: 'https://www.google.com',
	port: 443,	// if http default 80, if https default 443
	headers: {
		'Content-Type': 'text/xml'	// default 'application/x-www-form-urlencoded'
	},
	data: {
		deviceId: 977748,
		deviceStatus: 'inGame'
	}
};

reqHttp(options, function (err, json, resHeaders) {
	if (err) {
		console.log(err);
	}
	console.log(resHeaders);
	console.log(json);
});
```

## Options

### url `String`
request url

### method `String`
Default `GET`
request method `POST` `GET` `PUT` `DEL` `.etc`

### headers
Default `null`
request headers
support like ['Content-Type'] [Cookie]

### data `Json Object`
Default `null`
Example: 
```
{
	hello: world
}

```

if method is get, options is
```
{
	url: 'http://google.com'
	data: {
		hello: world
	}
}
```
then send request to `http://google.com?hello=world`

### timeout `Integer`
Default `60000`
request timout in millisecond.
`60000` means One minute.

### chunkMode `Boolean`
Default `false`

If chunkMode set true, then res data is a chunk object like:
```
resObj = {
	data: String,
	ended: Boolean
};
```
The responseCallback Package into a chunk object.
last chunk resObj.ended is `true`.

### lineMode `Boolean`
Default `false`
If lineMode set true, then res data is a line object like:
```
resObj = {
	data: String,
	ended: Boolean
};
```
resObj.data is parsed response to every line by `\r\n` or `\r` ro `\n`.
The responseCallback Package into a line object.
last line resObj.ended is `true`.

### redirectChain `Boolean`
Default `false`

Sometime, the request often get server response status `301` || `302` || `303`. This http code means that URI of requested resource has been changed.

If redirectChain set to true. request_http will auto redirect to finally url. request_http support response headers set-cookie in next every chain node. Finally response the Correct Response.

### redirectChainLimit `Integer`
Default `10`
the redirectChain max redirect count.

vaild when redirectChain set to `true`.

### headersOnly `Boolean`
Default `true`

Only get response headers when headersOnly set to true.
If headersOnly set true, the responseCallback data always is `null`.

## Example code
```

// GET TEST
var options = {
	url: 'https://www.google.com'
};

reqHttp(options, function (err, resBody, resHeaders) {
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

reqHttp(options, function (err, resBody, resHeaders) {
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

reqHttp(options, function (err, resBody, resHeaders) {
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
reqHttp(options, function (err, chunkObj, resHeaders) {
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
reqHttp(options, function (err, lineObj, resHeaders) {
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

```