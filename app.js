const express = require('express');
const bodyParser = require('body-parser');
const app = express();

app.set('views', './views');
app.set('view engine', 'pug');

app.use(express.static('public'));
app.use(bodyParser.urlencoded({extended: true}));

app.get('/', function(req, res) {
	res.render('index', {title: 'Home'});
});

var signupRouter = require('./signup');
app.use('/signup', signupRouter);

app.listen(3000, function() {
	console.log('App listening on port 3000');
});