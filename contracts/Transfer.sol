//SPDX-License-Identifier: MIT
// Transfer tokens from a contract
// 3 ways - transfer (2300 gas, reverts), send (2300 gas, returns bool), call (all gas, returns bool and data)

pragma solidity ^0.8.0;


contract SendEther {

    constructor() payable {

    }

    function sendViaTransfer (address payable _to) external payable {
        _to.transfer(123);
    }
    function sendViaSend (address payable _to) external payable {
        bool sent = _to.send(123);
    }
    function sendViaCall (address payable _to) external payable {
        (bool success, bytes memory data) = _to.call{value:123}("");
    }
 
}