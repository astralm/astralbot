var reducer = require('./reducer.js')(require('mysql').createConnection(require('./constants/env.js').mysql)),
		Events = require('./creators/index.js');
require("./ws/index.js")(
	require('socket.io')(require('http').createServer().listen(8080)), 
	reducer, 
	Events
);







