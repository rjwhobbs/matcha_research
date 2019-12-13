const mysql = require('mysql');

let settingsOne = {
	host: 'localhost',
	user: 'test2',
	password: 'XYfErbAQ8dAvrjKc',
	database: 'testdb',
	socketPath: '/Users/RogerHobbs/Desktop/Server/mysql/tmp/mysql.sock'
};

let settingsTwo = {
	host: 'localhost',
	user: 'root',
	password: 'pw123456',
	database: 'testdb',
	socketPath: '/goinfre/rhobbs/Desktop/Server/mysql/tmp/mysql.sock'
};

let conn = mysql.createConnection(settingsOne);

conn.connect(function(err) {
	if (err) {throw err}
	console.log('MySQL connected');
});

module.exports = conn;