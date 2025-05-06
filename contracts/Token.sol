//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Token {
    string public name;
    string public symbol;
    uint256 public decimals = 18;
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;
    // Add allowance mapping to track the approved spending limit of each address
        // This allows us to implement the approve and transferFrom functions
        // The allowance mapping is a NESTED mapping that tracks the approved spending limit
        // Note the key value pair

    event Transfer(
        address indexed from,
        address indexed to,
        uint256 value
    );

        // Add event to log approvals
        // This allows us to track when an address approves another address to spend its tokens
        // The event is emitted when the approve function is called
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
        // Note again how varibales in evenets are state (w/out underscore)

    constructor(
        string memory _name,
        string memory _symbol,
        uint256 _totalSupply
    ) {
        name = _name;
        symbol = _symbol;
        totalSupply = _totalSupply * (10**decimals);
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address _to, uint256 _value)
        public
        returns (bool success)
    {
        require(balanceOf[msg.sender] >= _value);
        require(_to != address(0));

        balanceOf[msg.sender] = balanceOf[msg.sender] - _value;
        balanceOf[_to] = balanceOf[_to] + _value;

        emit Transfer(msg.sender, _to, _value);

        return true;
    }

    // Add Approval function
        // This function allows an address to approve another address to spend its tokens
        // The function takes two parameters: the address to approve and the amount to approve
        // The function checks if the spender address is valid (not zero address)
        // The function updates the allowance mapping to set the approved spending limit
        // The function emits an Approval event to log the approval
        // The function returns true if the approval is successful
    function approve(address _spender, uint256 _value)
        public
        returns(bool success)
    {
        require(_spender != address(0));

        allowance[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);
        
        return true;
    }

}
