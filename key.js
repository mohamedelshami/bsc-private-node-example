var keythereum = require("keythereum");

var datadir = "/node1";
var address= "0x6b990a45e661aa23c5d71a6725c3be065c08f58c";
const password = "Test123";
var keyObject = keythereum.importFromFile(address, datadir);
var privateKey = keythereum.recover(password, keyObject);

console.log(privateKey.toString('hex'));
