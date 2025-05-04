//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Token {
    string public name;
    string public symbol;
    uint256 public decimals = 18;
    uint256 public totalSupply;

// ==================== ADD MAPPING ====================
    // Mapping from address to balance
    // This allows us to track the balance of how many tokens each address holds
    mapping(address => uint256) public balanceOf;
        // ↑ The mapping is a key-value store where the key is an address and the value is the balance
        // The public keyword automatically creates a getter function for this mapping
        // The getter function allows you to check the balance of any address

    constructor(string memory _name, string memory _symbol, uint256 _totalSupply) {
        name = _name;
        symbol = _symbol;
        totalSupply = _totalSupply * (10**decimals);
        balanceOf[msg.sender] = totalSupply;
            /* ↑ 
            Assign the total supply to the address that deploys the contract
            This means the deployer starts with all the tokens
            The msg.sender is the address that deployed the contract
            This is a special global variable in Solidity that refers to the address that called the current function
            Address [0] in Hardhat is the first account in the local blockchain network (deployer-msg.sender)
            */
    }
}
