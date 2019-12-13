const uuid = require('uuid/v4');
const _ = require('lodash');
const express = require('express');
let conn = require('./mysqlDB/conn');
let sql = require('./mysqlDB/statements');

let router = express.Router();
module.exports = router;

router.get('/', function(req, res) {
	let result;
	conn.query(sql.selectAllBasicUsers, function(err, results) {
		if (err) {throw err}
		result = results;
		let origUrl = req.originalUrl;
		console.log(results);
		res.render('signup', {
			title: 'Signup',
			origUrl: origUrl,
			result: result
		});
	});
});