//SPDX-License-Identifier: MIT
// Time Locked Contract which allows funds to be withdrawn only after a certain time has elapsed

pragma solidity ^0.8.0;

contract TimeLock {
    address payable public benificiary;
    uint public releaseTime;

    constructor(address payable _beneficiary, uint _releaseTime){
        benificiary=  _beneficiary;
        releaseTime= _releaseTime;
    }

    function withdraw() public {
        require(block.timestamp>= releaseTime,"Funds are locked");
        require(msg.sender == benificiary, "Not authorized");
        payable(msg.sender).transfer(address(this).balance);
    }
}