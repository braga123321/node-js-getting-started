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
  var sql = "CREATE TABLE Teste1 (name VARCHAR(255), ID int(10))";
  connection.query(sql, function (err, result) {
    if (err) throw err;
    console.log("Table created");
  });
});