//SPDX-License-Identifier: MIT
// check balance of an address


pragma solidity ^0.8.0;

contract BalanceChecker {
    function getBalance(address _address) public view returns (uint) {
        return _address.balance;
    }
}
