const uuid = require('uuid/v4');
const _ = require('lodash');
const express = require('express');
const session = require('express-session');
let conn = require('./mysqlDB/conn');
let sql = require('./mysqlDB/statements');

let router = express.Router();
module.exports = router;

let testSql1 = 'INSERT INTO testusers (`username`, `email`, `password`) VALUES (?, ?, ?)';
let testSql2 = 'INSERT INTO testtags (`user_id`, `tag`, `username`) VALUES (?, ?, ?)';

let arr1 = ['Derp', 'derp@derp.com', 'derp'];
let arr2 = [ 2, "derpy", "Derp"];

router.get('/', function(req, res) {
	conn.query(testSql2, arr2, function(err, results, feilds) {
		if (err) {throw err}
		console.log(results);
		console.log(feilds);
		res.send("Welcome to the test page");
	});
});