//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Token {
    string public name;
    string public symbol;
    uint256 public decimals = 18;
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;

/* ==================== ADD EVENT ====================
    Event to log transfers
        This allows us to track when tokens are transferred
        The event is emitted when the transfer function is called
        The indexed keyword allows us to filter events by the indexed parameters
        This means we can search for events by the from and to addresses
        The value parameter is not indexed because we don't need to filter by it
        The event is declared outside of the constructor and functions
    Events are:
        used to log information on the blockchain
        stored in the transaction logs and can be accessed by external applications
        a way to communicate with the outside world
        used to notify external applications about changes in the contract state
        used to log important information about the contract
        used to track the history of the contract
        used to track the state of the contract
        used to track the flow of tokens
        used to track the ownership of tokens
    */
    event Transfer(
        address indexed from,
        address indexed to,
        uint256 value
    );

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

/* ==================== ADD TRANSFER FUNCTION ====================
    -allows the owner of the tokens to transfer them to another address
    -takes two parameters: the address to transfer to and the amount to transfer
    -checks if the sender has enough balance to transfer the tokens
    -checks if the recipient address is valid (not zero address)
    -updates the balances of the sender and recipient
    -emits a Transfer event to log the transfer
    -returns true if the transfer is successful
    -is public, which means it can be called by anyone
    -returns a boolean value indicating the success of the transfer
    -is not payable, which means it cannot receive ether
    -does not modify the state of the contract
    */
    function transfer(address _to, uint256 _value)
        public
        returns (bool success)
    {
        // Require statements are used to validate the input parameters
            // They check if the sender has enough balance to transfer the tokens
            // and if the recipient address is valid (not zero address)
            // If any of the require statements fail, the transaction will revert
            // and the state of the contract will not be modified
        require(balanceOf[msg.sender] >= _value);
        require(_to != address(0));
            // Require valid address

        balanceOf[msg.sender] = balanceOf[msg.sender] - _value;
        balanceOf[_to] = balanceOf[_to] + _value;
        // Deducting the amount from the sender's (spender) balance
        // Crediting the amount to the recipient's balance

        // Emitting the Transfer event to log the transfer
            // The event is emitted with the sender's address, recipient's address, and the amount transferred
            // This allows us to track the transfer on the blockchain
            // The event is indexed, which means we can filter events by the indexed parameters
        emit Transfer(msg.sender, _to, _value);

        return true;
    }
}
