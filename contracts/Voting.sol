//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Voting {

    struct Voter {
        uint weight;
        bool voted;
        address delegate;
        uint vote;
    }

    struct Proposal {
        bytes32 name;
        uint voteCount;
    }

    address public chairperson;
    mapping (address=>Voter) voters;
    Proposal[] public proposals;
}