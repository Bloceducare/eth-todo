var ethTodo = artifacts.require("ethTodo");

module.exports = function(deployer) {
  deployer.deploy(ethTodo);
};
