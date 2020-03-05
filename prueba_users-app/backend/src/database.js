//const mysql = require('mysql');
const mongoose = require('mongoose');

async function connect(){
    await mongoose.connect('mongodb://localhost/flutter-node-tutorial',{
        userNewUrlParser: true
    });
    console.log('Database: Connected');
};

module.exports = {connect};