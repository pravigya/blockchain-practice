//SPDX-License-Identifier: MIT
// withdraw funds from a smart contract

pragma solidity ^0.8.0;

contract FundWithdrawl {

    address payable public owner;
    mapping(addres=>uint) public balances;

    constructor(){
        owner = payable(msg.sender);
    }

    receive() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        require(msg.sender == owner, "Only owner can withdraw funds");
        uint amount = balances[msg.sender];
        require(amount > 0, "Insufficient funds to withdraw");
        balances[msg.sender] =  0;
        owner.transfer(amount);
    }
}