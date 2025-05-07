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
    /* ↑ Added NESTED mapping
        The allowance mapping is a NESTED mapping that tracks the approved spending limit
        The first address is the owner of the tokens
        The second address is the spender of the tokens
        The value is the amount of tokens that the spender is allowed to spend on behalf of the owner
        */

    event Transfer(
        address indexed from,
        address indexed to,
        uint256 value
    );

    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    /* ↑ Addec event to log approvals
        This allows us to track when tokens are approved for spending
        The event is emitted when the approve function is called
        The indexed keyword allows us to filter events by the indexed parameters
        The event is declared outside of the constructor and functions
        */

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

        _transfer(msg.sender, _to, _value);
        // ↑ Changed emit Transfer to _transfer
            // to be used in the transfer function

        return true;
    }

    function _transfer(
        address _from,
        address _to,
        uint256 _value
    ) internal {
        require(_to != address(0));

        balanceOf[_from] = balanceOf[_from] - _value;
        /* ↑ Check balance of the sender
            The _from address is the owner of the tokens
                Modified <_msg.sender> --> <_from>
            The _to address is the recipient of the tokens
            The _value is the amount of tokens to be transferred
            */
        balanceOf[_to] = balanceOf[_to] + _value;

        emit Transfer(_from, _to, _value);
    }        
    // ↑ Added internal {}

    function approve(address _spender, uint256 _value)
        public
        returns(bool success)
    {
        require(_spender != address(0));

        allowance[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);
        return true;
    }
    // ↑ Added approve function
        // The approve function allows the owner of the tokens to approve a third party to spend tokens on their behalf

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    )
        public
        returns (bool success)
    {
        require(_value <= balanceOf[_from]);
        /* ↑ Check balance of the sender
        This is the key part of the transferFrom function
            The transferFrom function allows a third party to transfer tokens on behalf of the owner
            The _from address is the owner of the tokens
            The _to address is the recipient of the tokens
            The _value is the amount of tokens to be transferred
        The transferFrom function is used to transfer tokens from one address to another
        */
        require(_value <= allowance[_from][msg.sender]);
        // ↑ Check approval

        allowance[_from][msg.sender] = allowance[_from][msg.sender] - _value;
        // ↑ Reset the allowance
            // This is the key part of the transferFrom function

        _transfer(_from, _to, _value);
        // ↑ Spending the allowance
            // This is the key part of the transferFrom function
            // The allowance mapping is a NESTED mapping that tracks the approved spending limit

        return true;
    }

}
