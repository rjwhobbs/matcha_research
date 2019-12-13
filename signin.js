const uuid = require('uuid/v4');
const _ = require('lodash');
const express = require('express');
//const session = require('express-session');
let conn = require('./mysqlDB/conn');
let sql = require('./mysqlDB/statements');


let router = express.Router();
module.exports = router;

router.get('/', function(req, res) {
	res.render('signin', {
		title: 'Signin'
	});
}).post('/', function(req, res) {
	let username = req.body.Username;
	let passwd = req.body.Password;
	conn.query(sql.selectPasswd, [username], function(err, results, feilds) {
		if (err) {throw err}
		// This will need to be encryted and decrypted
		//console.log(feilds);
		if (results.length > 0 && passwd == results[0].passwd) {
			req.session.username = username;
			req.session.loggedin = true;
			res.render('signin', {auth: req.session.loggedin});
		} else {
			res.render('signin');
		}
	});
});