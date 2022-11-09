require("@nomicfoundation/hardhat-toolbox");
require("@nomiclabs/hardhat-etherscan");
require('dotenv').config();

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.17",
  networks: {
    hardhat: {
      chainId: 1337,
    },
    goerli: {
      url: `https://goerli.infura.io/v3/${process.env.PROVIDER_KEY}`,
      accounts: [process.env.DEPLOY_WALLET_PRIVATE_KEY]
    },
    mainnet: {
      url: `https://mainnet.infura.io/v3/${process.env.PROVIDER_KEY}`,
      accounts: [process.env.DEPLOY_WALLET_PRIVATE_KEY]
    }

  },
  etherscan : {
    apiKey: process.env.ETHERSCAN_KEY
  }
};
