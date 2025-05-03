//SPDX-License-Identifier: Unlicense
// ↑ This line specifies the license under which the code is released.
// The SPDX identifier helps with license compliance in open-source projects.

pragma solidity ^0.8.0;
// ↑ This line specifies the Solidity compiler version to use.
// The ^ symbol means "this version or newer within the same major version"
// Solidity is the programming language used to write smart contracts on Ethereum.

import "hardhat/console.sol";
// ↑ This imports the console functionality from Hardhat, which allows for
// debugging by printing values to the console during development and testing.

// A contract is like a class in other programming languages - it contains
// data (state variables) and functions that can modify that data.
contract Token {
    // STATE VARIABLES SECTION
    // These variables store the permanent state of the contract on the blockchain.
    // The 'public' keyword automatically creates getter functions for these variables.

    string public name;        // The full name of the token (e.g., "Ethereum")
    string public symbol;      // The symbol/ticker of the token (e.g., "ETH")

    uint256 public decimals = 18;
    // ↑ Decimals represent how divisible a token can be
    // Most tokens use 18 decimals (following Ethereum's convention)
    // This means 1 token = 10^18 of the smallest unit (like wei in Ethereum)

    uint256 public totalSupply;
    // ↑ The total number of tokens in existence (in the smallest unit)
    // 'uint256' is an unsigned integer (positive numbers only) that can hold very large values

    // TODO: We need to implement these features:
    // 1. Track balances of each address using a mapping
    // 2. Implement functions to send tokens between addresses

    // CONSTRUCTOR SECTION
    // The constructor is a special function that runs ONLY ONCE when the contract is deployed.
    // It cannot be called again after deployment.
    constructor(string memory _name, string memory _symbol, uint256 _totalSupply) {
        // Parameters with an underscore prefix (_name) are local variables
        // that are passed into the constructor when deploying the contract

        // Initialize the state variables with the provided values
        name = _name;
        symbol = _symbol;

        // Calculate the total supply with the correct number of decimal places
        // For example, if _totalSupply = 1,000,000 and decimals = 18,
        // then totalSupply = 1,000,000 * 10^18 = 1,000,000,000,000,000,000,000,000
        totalSupply = _totalSupply * (10**decimals);
    }

    // FUNCTIONS SECTION
    // This is where you would add functions to:
    // - Transfer tokens between addresses
    // - Approve other addresses to spend tokens on your behalf
    // - Check balances
    // - And other token functionality
}
