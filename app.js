const express = require('express');
const bodyParser = require('body-parser');
const session = require('express-session');
const app = express();

app.set('views', './views');
app.set('view engine', 'pug');

app.use(session({
	secret: 'secret',
	resave: 'true',
	saveUninitialized: true
}));
app.use(express.static('public'));
app.use(bodyParser.urlencoded({extended: true}));

app.get('/', function(req, res) {
	res.render('index', {title: 'Home'});
});

let signupRouter = require('./signup');
app.use('/signup', signupRouter);

let signinRouter = require('./signin');
app.use('/signin', signinRouter);

app.listen(3000, function() {
	console.log('App listening on port 3000');
});