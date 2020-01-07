const uuid = require('uuid/v4');
const _ = require('lodash');
const express = require('express');
const session = require('express-session');
let conn = require('./mysqlDB/conn');
let sql = require('./mysqlDB/statements');