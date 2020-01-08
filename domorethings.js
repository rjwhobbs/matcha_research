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
let testSql3 = 'INSERT INTO testmessages (`user_id`, `message`, `username`) VALUES (?, ?, ?)';
let doTheJoins = "SELECT testusers.username, testtags.tag FROM testusers INNER JOIN testtags ON testusers.user_id = testtags.user_id";
let doTheJoins2 = "SELECT testusers.username, testtags.tag " + 
					"FROM testusers " + 
					"INNER JOIN testtags " +
					"ON testusers.user_id = ?";
let doTheJoins4 = "SELECT testusers.username, testtags.tag, testmessages.message " + 
					"FROM testusers " + 
					"INNER JOIN testtags " +
					"INNER JOIN testmessages " +
					"ON testusers.user_id = ?";
let doTheJoins3 = "SELECT testusers.username, testusers.email, testtags.tag FROM testusers INNER JOIN testtags ON testusers.user_id = ?";
let sqlDelete = "DELETE FROM testusers " +
					"WHERE user_id = ?";

let arr1 = ['Derp', 'derp@derp.com', 'derp'];
let arr2 = [2, "this is derpy message", "Derp"];
let arr3 = [2];

router.get('/', function(req, res) {
	conn.query(sqlDelete, arr3, function(err, results, feilds) {
		if (err) {throw err}
		console.log(results);
		//console.log(feilds);
		res.send("Welcome to the test page");
	});
});