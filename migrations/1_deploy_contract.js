const CollectionFactory = artifacts.require("CollectionFactory");

module.exports = async function(deployer) {
  deployer.deploy(CollectionFactory);
};
