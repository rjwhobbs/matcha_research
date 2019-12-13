const uuid = require('uuid/v4');
const _ = require('lodash');
const express = require('express');
let conn = require('./mysqlDB/conn');
let sql = require('./mysqlDB/statements');

let router = express.Router();
module.exports = router;

router.get('/', function(req, res) {
	res.render('signin');
});