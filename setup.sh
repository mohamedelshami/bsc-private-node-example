
# Init Nodes
./build/bin/geth --datadir node1 init genesis.json
./build/bin/geth --datadir node2 init genesis.json

# Start bootstrap node
./build/bin/geth --datadir node1 --networkid 1000 console

# Start a second node with rpc enabled
./build/bin/geth --datadir node2 --port 30304 --nodiscover --networkid 1000 console --rpc --rpcport 8545 --ws --wsport 8546 --rpcaddr 127.0.0.1 --rpccorsdomain "*" --rpcapi "eth,net,web3,personal,miner"
# Complete add member instructions and balance transfer described here https://docs.binance.org/smart-chain/developer/deploy/local.html
# Once mining in successful use of the accounts from node 2 with rpc enabled to connect to with truffle and deploy the contract
# Use the key.js to export the test account private key needed for truffle-config.js