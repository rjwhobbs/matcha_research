const uuid = require('uuid/v4');
const _ = require('lodash');
const express = require('express');

var router = express.Router();
module.exports = router;

router.get('/', function(req, res) {
	var origUrl = req.originalUrl;
	res.render('signup', {
		title: 'Signup',
		origUrl: origUrl
	});
});