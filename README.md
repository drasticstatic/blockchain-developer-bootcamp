# Dapp University Bootcamp - Token Exchange

This project is a blockchain-based token exchange application built during the Dapp University Bootcamp.
Demonstrating how to create, deploy, and interact with Ethereum smart contracts.

## Project Overview

This application includes:
- A custom ERC-20 token smart contract (DAPPU)
- Smart contract testing with Hardhat
- React frontend for interacting with the blockchain
- Integration with MetaMask for wallet connectivity

## Prerequisites

Before getting started, make sure you have:
- [Node.js](https://nodejs.org/) (v14+ recommended)
- [npm](https://www.npmjs.com/) (comes with Node.js)
- [MetaMask](https://metamask.io/) browser extension
- Basic knowledge of JavaScript, React, and blockchain concepts

## Installation

1. Clone this repository
2. Install dependencies:
   
   To check if node is installed:
   ```node -v```
   
   >If not installed: ```curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash```
   
   Run: ```nvm -v```
   
   >If not installed:
   
   >>Since macOS 10.15, the default shell is zsh and nvm will look for .zshrc to update, none is installed by default. Create one with ```touch ~/.zshrc``` and run the install script again.
            Rerun: ```curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash```


   Use nvm to install the latest LTS release of Node.js ```nvm install --lts```

      To install a specific version:
               ```nvm install x.xx.x```
                        ex: nvm install 8.16.2

      Example to set the default version of node to use when starting a new shell to 10.0.0:
         ```nvm alias default 10.0.0```
                > nvm alias 20.10

      To see the entire list of Node.js versions available to install, enter the following: ```nvm ls-remote```

      To select a version:
         ```nvm use xx``` >ex=: nvm use 22
      
      To upgrade npm to the latest version:```npm install npm --global```


3. Create a `.env` file in the root directory with your private keys and API keys:
   ```
   PRIVATE_KEYS=your_private_key
   ALCHEMY_API_KEY=your_alchemy_api_key
   ETHERSCAN_API_KEY=your_etherscan_api_key
   ```

## Blockchain Development
To start new project:

   ## Hardhat:
   > mkdir 'hardhat_example'

   > cd 'hardhat_example'

```npm init --yes``` creates 'package.json'

```npm install --sav-dev hardhat```

```npx hardhat``` to create new project
        
   >select "no" to installing dependencies

   >if selected "yes" , delete 'package-lock.json' & 'node_modules' directories
        
#### Change package.json to reflect the following:

      {
         "name": "hardhat_example",
         "version": "1.0.0",
         "description": "",
         "main": "index.js",
         "scripts": {
         "test": "echo \"Error: no test specified\" && exit 1"
         },
         "keywords": [],
         "author": "",
         "license": "ISC",
         "devDependencies": {
         "@nomiclabs/hardhat-ethers": "^2.0.6",
         "@nomiclabs/hardhat-waffle": "^2.0.3",
         "chai": "^4.3.6",
         "ethereum-waffle": "^3.4.4",
         "ethers": "^5.6.8",
         "hardhat": "^2.9.7"
         }
      }

After updating 'package.json' , rerun: ```npm install```

#### Adjust hardhat.config.js to reflect the following:

    require("@nomiclabs/hardhat-waffle");

    /** @type import('hardhat/config').HardhatUserConfig */
    module.exports = {
      solidity: "0.8.19",
      networks: {
        localhost: {}
      },
    };

        changing line 1: require("@nomicfoundation/hardhat-toolbox");
          to "@nomiclabs/hardhat-waffle"


### Compile Smart Contracts
   To create ABI - json description of smart contract
   & byte code - human readable code --> machine code for EVM
```
npx hardhat compile
```

### Run Tests
```
npx hardhat test
```

### Deploy to Local Network
```
npx hardhat node
npx hardhat run scripts/1_deploy.js --network localhost
```
or
```
npx hardhat run --network localhost ./scripts/1_deploy.js
```

### Deploy to Sepolia Testnet
```
npx hardhat run scripts/1_deploy.js --network sepolia
```

### Verify Contract on Etherscan
```
npx hardhat verify --network sepolia <contract address> <constructor args>
```
   Ex: > npx hardhat verify --network sepolia <contract address>“Dapp University” “DAPPU” “1000000”

# Getting Started with Create React App

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).
   To create react app:
   ```
   npx create-react-app blockchain-developer-bootcamp --use-npm
   ```
      Modify app.js file in "src" directory to see reflected changes

## Available Scripts

In the project directory, you can run:

### `npm start`

Runs the app in the development mode.\
Open [http://localhost:3000](http://localhost:3000) to view it in your browser.

The page will reload when you make changes.\
You may also see any lint errors in the console.

### `npm test`

Launches the test runner in the interactive watch mode.\
See the section about [running tests](https://facebook.github.io/create-react-app/docs/running-tests) for more information.

### `npm run build`

Builds the app for production to the `build` folder.\
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.\
Your app is ready to be deployed!

See the section about [deployment](https://facebook.github.io/create-react-app/docs/deployment) for more information.

### `npm run eject`

**Note: this is a one-way operation. Once you `eject`, you can't go back!**

If you aren't satisfied with the build tool and configuration choices, you can `eject` at any time. This command will remove the single build dependency from your project.

Instead, it will copy all the configuration files and the transitive dependencies (webpack, Babel, ESLint, etc) right into your project so you have full control over them. All of the commands except `eject` will still work, but they will point to the copied scripts so you can tweak them. At this point you're on your own.

You don't have to ever use `eject`. The curated feature set is suitable for small and middle deployments, and you shouldn't feel obligated to use this feature. However we understand that this tool wouldn't be useful if you couldn't customize it when you are ready for it.

## Learn More

You can learn more in the [Create React App documentation](https://facebook.github.io/create-react-app/docs/getting-started).

To learn React, check out the [React documentation](https://reactjs.org/).

### Code Splitting

This section has moved here: [https://facebook.github.io/create-react-app/docs/code-splitting](https://facebook.github.io/create-react-app/docs/code-splitting)

### Analyzing the Bundle Size

This section has moved here: [https://facebook.github.io/create-react-app/docs/analyzing-the-bundle-size](https://facebook.github.io/create-react-app/docs/analyzing-the-bundle-size)

### Making a Progressive Web App

This section has moved here: [https://facebook.github.io/create-react-app/docs/making-a-progressive-web-app](https://facebook.github.io/create-react-app/docs/making-a-progressive-web-app)

### Advanced Configuration

This section has moved here: [https://facebook.github.io/create-react-app/docs/advanced-configuration](https://facebook.github.io/create-react-app/docs/advanced-configuration)

### Deployment

This section has moved here: [https://facebook.github.io/create-react-app/docs/deployment](https://facebook.github.io/create-react-app/docs/deployment)

### `npm run build` fails to minify

This section has moved here: [https://facebook.github.io/create-react-app/docs/troubleshooting#npm-run-build-fails-to-minify](https://facebook.github.io/create-react-app/docs/troubleshooting#npm-run-build-fails-to-minify)
# blockchain-developer-bootcamp
