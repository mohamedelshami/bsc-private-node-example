const Precompiles = artifacts.require("Precompiles");

module.exports = function (deployer) {
  deployer.deploy(Precompiles);
};
