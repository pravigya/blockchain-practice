//SPDX-License-Identifier: MIT
// Check if the given address is a contract 
// uses the opcode extcodesize which returns the size of the code on a contract 
pragma solidity ^0.8.0;

contract ContractChecker {
    function isContract (address _addr) external view returns (bool){
        uint256 size;
        assembly {
            size := extcodesize (_addr)
        }
        return size > 0;
    }
}