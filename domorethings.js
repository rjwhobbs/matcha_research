const uuid = require('uuid/v4');
const _ = require('lodash');
const express = require('express');
const session = require('express-session');
let conn = require('./mysqlDB/conn');
let sql = require('./mysqlDB/statements');

let router = express.Router();
module.exports = router;

let testSql = 'INSERT INTO testusers (`username`, `email`, `password`) VALUES (?, ?, ?)';


router.get('/', function(req, res) {
	conn.query(testSql, ["Derp", "derp@derp", "derp"], function(err, results, feilds) {
		if (err) {throw err}
		res.send("Welcome to the test page");
	});
});