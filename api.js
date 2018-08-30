////// GLINTS ////
const showResto = require('./controller/showResto');
const postResto = require('./controller/postResto');
const register = require('./controller/register');
const login = require('./controller/login');
const newCollection = require('./controller/newCollection');
const addCollectionUser = require('./controller/addCollectionUser');
const getCollection = require('./controller/getCollection');
const getCollectionUser = require('./controller/getCollectionUser');
const addCollectionResto = require('./controller/addCollectionResto');
const getCollectionResto = require('./controller/getCollectionResto');
const editCollectionName = require('./controller/editCollectionName');
//////// GLINTS //////


var express = require('express');
var app = express();
var mailer = require('express-mailer');
mailer.extend(app, {
    from: 'hirzangaming@gmail.com',
    host: 'smtp.gmail.com', // hostname
    secureConnection: true, // use SSL
    port: 465, // port for secure SMTP
    transportMethod: 'SMTP', // default is SMTP. Accepts anything that nodemailer accepts
    auth: {
        user: 'hirzangaming@gmail.com',
        pass: 'izan808080'
    }
});

// app.use(express.json())

const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json())
app.use(function (req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next();
});

app.set('port', process.env.PORT || 3210);
app.set('views', __dirname + '/views');
app.set('view engine', 'jade');

app.get('/', function (req, res) {
    res.send('Express Works');
});

app.get('/zan', function (req, res) {
    res.send('Hirzan Express');
})



/////// GLINTS TEST //////////////

app.get('/showresto', showResto);
app.post('/postresto/:id', postResto);
app.post('/register', register);
app.post('/login', login);
app.post('/collection/create', newCollection);
app.post('/collection/addresto', addCollectionResto);
app.post('/collection/adduser', addCollectionUser);
app.get('/collection/getcollection/:id', getCollection);
app.get('/collection/getuser/:id', getCollectionUser);
app.get('/collection/getresto/:id', getCollectionResto);
app.patch('/collection/editresto', editCollectionName);

app.post('/testemail', (req, res) => {
    console.log('req', req.body);
    app.mailer.send('email', {
        to: req.body.user_email, // REQUIRED. This can be a comma delimited string just like a normal email to field. 
        subject: 'Group Invitation', // REQUIRED.
        otherProperty: 'Other Property' // All additional properties are also passed to the template as local variables.
    }, function (err) {
        if (err) {
            // handle error
            console.log(err);
            res.send(err);
            return;
        }
        res.send('Email Sent');
    });
    res.send('Email Sent');
});




app.listen(app.get('port'), function () {
    console.log('express Started!');
})