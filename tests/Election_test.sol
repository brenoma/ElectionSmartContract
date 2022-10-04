// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "remix_tests.sol"; 
import "hardhat/console.sol";
import "../contracts/Election.sol";

contract ElectionTest {

    bytes32[] candidatesNames;

    Election electionToTest;

    function beforeAll () public {
        candidatesNames.push(bytes32("Breno Araripe"));
        electionToTest = new Election(candidatesNames);
    }

    function checkWinningProposal () public {
        console.log("Running checkWinningProposal");
        electionToTest.vote(0);
        Assert.equal(electionToTest.electedCandidate(), uint(0), "proposal at index 0 should be the winning proposal");
        Assert.equal(electionToTest.electorWinner(), bytes32("Breno Araripe"), "Breno Araripe should be the winner name");
    }

    function checkWinninProposalWithReturnValue () public view returns (bool) {
        return electionToTest.electedCandidate() == 0;
    }
}