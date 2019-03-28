var express = require('express');
var mysql = require('mysql');
var morgan = require('morgan');
var bodyParser = require('body-parser');

var app = new express();

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "projet2"
});

con.connect(function(err) {
  if (err) throw err;
  //console.log("Mysql Connected!");
});

app.use(morgan('combined'))
.use(bodyParser.urlencoded({ extended: false }))
.use(bodyParser.json())
.use(express.static(__dirname+'/assets'))
.get('/', function(req, res) {
  con.query('SELECT * FROM produits', function (err, result) {
    if (err) throw err;
    res.render('index.ejs', {produits: result});
  });
})
.get('/commander/:id', function(req, res) {
  con.query('SELECT * FROM produits WHERE id=? LIMIT 1', req.params.id, function (err, result) {
    if (err) throw err;
    res.render('commande.ejs', {prod: result[0]});
  });
})
.post('/valider-commande/:id', function(req, res) {
  var sql = "INSERT INTO commandes(id_produit, nom_client, contact, adresse) VALUES ?",
  param = [
    [req.params.id,
    req.body.nom,
    req.body.contact,
    req.body.adresse]
  ];
  con.query(sql, [param], function (err, result) {
    if (err) throw err;
    res.render('commande-ok.ejs');
  });
})
;

app.listen(8081);
