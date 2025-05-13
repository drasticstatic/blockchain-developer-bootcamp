require("@nomiclabs/hardhat-waffle");
require("dotenv").config();

const private_KEYS = process.env.PRIVATE_KEYS || "";
const alchemy_API_KEY = process.env.ALCHEMY_API_KEY || "" // <|| ""> = or emtpy string

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.8.19",
  networks: {
    localhost: {},
    //Added sepolia testnet:
    sepolia: {
      url: `https://eth-sepolia.g.alchemy.com/v2/${process.env.ALCHEMY_API_KEY}`,
      accounts: private_KEYS.split(',') // Split the private keys by comma in .env file
    }
  },
  //Add etherscan API key for verification:
  etherscan : {
    apiKey: {
      sepolia: process.env.ETHERSCAN_API_KEY
    }
  }
};
