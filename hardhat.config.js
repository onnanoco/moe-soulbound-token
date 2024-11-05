require("@nomiclabs/hardhat-waffle");
require("@nomicfoundation/hardhat-verify");
require("dotenv").config();

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  defaultNetwork: "sepolia",
  networks: {
    sepolia: {
      url: process.env.SEPOLIA_RPC_ENDPOINT,
      accounts: [process.env.OWNER_PRIVATE_KEY],
      chainId: 11155111,
      gas: "auto",
      gasPrice: "auto"
    },
    ethereum: {
      url: process.env.ETHEREUM_RPC_ENDPOINT,
      accounts: [process.env.OWNER_PRIVATE_KEY],
      chainId: 1,
      gas: "auto",
      gasPrice: "auto"
    }
  },
  etherscan: {
    apiKey: ETHERSCAN_API_KEY
  },
  paths: {
    sources: "./contracts",
    cache: "./cache",
    artifacts: "./artifacts"
  },
  solidity: {
    version: "0.8.28",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  }
};