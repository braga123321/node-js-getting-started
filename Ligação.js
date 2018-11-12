var mysql = require('mysql');
var connection = mysql.createConnection({
  host: "webitcloud.net",
  user: "webitclo_B405",
  password: "PW1819#B405214"
});

connection.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
 
});