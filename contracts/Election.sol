pragma solidity ^0.8.7;
// SPDX-License-Identifier: MIT

contract Election {
    
    struct Elector {
        bool hasVoted;
        uint vote;
    }

    struct Candidate {
        bytes32 name;
        uint votes;
    }

    mapping(address => Elector) public electors;

    Candidate[] public candidates;

    constructor(bytes32[] memory candidatesNames) {

        for (uint i = 0; i < candidatesNames.length; i++) {
            candidates.push(Candidate({
                name: candidatesNames[i],
                votes: 0
            }));
        }
    }
    
    function vote(uint candidate) external {
        Elector storage sender = electors[msg.sender];

        require(!sender.hasVoted, "Already voted.");

        sender.vote = candidate;
        sender.hasVoted = true;

        candidates[candidate].votes += 1;
    }

    function electedCandidate() public view returns (uint electedCandidate_) {
        uint winnerVotesCount = 0;

        for (uint i = 0; i < candidates.length; i++) {
            if (candidates[i].votes > winnerVotesCount) {
                winnerVotesCount = candidates[i].votes;
                electedCandidate_ = i;
            }
        }
    }

    function electorWinner() external view returns (bytes32 electorWinner_) {
        electorWinner_ = candidates[electedCandidate()].name;
    }
}