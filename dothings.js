const uuid = require('uuid/v4');
const _ = require('lodash');
const express = require('express');
const session = require('express-session');
let conn = require('./mysqlDB/conn');
let sql = require('./mysqlDB/statements');


let router = express.Router();
module.exports = router;

router.get('/', function(req, res) {
	conn.query(sql.doTheJoins, function(err, results, feilds) {
		if (err) {throw err}
		// This will need to be encryted and decrypted
		//console.log(feilds);
		console.log(results);
		res.render('signin');
	});
	res.render('signin', {
		title: 'Signin'
	})
});
