# bsc-private-node-example
A simple private Binance Smart Chain setup example

This example is based on local network configuration described [here](https://docs.binance.org/smart-chain/developer/deploy/local.html)

It contains genesis.json configuration, key.js for generating test account private keys and example counter-contract

Truffle is required to deploy the contract. You may also need to install the following:

`npm install keythereum`

Inside the counter-contract directory:

`npm install @truffle/hdwallet-provider`

To deploy the contract to local bsc node:

`truffle migrate --network testnet`

