var mysql = require('mysql');
var connection = mysql.createConnection({
  host: "webitcloud.net",
  user: "webitclo_B405",
  password: "PW1819#B405214",
  database: "webitclo_B405"
});

connection.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
  connection.query("SELECT * from `webitclo_B405`.`Participação`", function (err, result, fields) {
    if (err) throw err;
    console.log(fields);
  });
});