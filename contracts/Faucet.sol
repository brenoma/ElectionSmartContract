pragma solidity ^0.8.7;
// SPDX-License-Identifier: MIT

contract Faucet {

    receive() external payable {}

    function withdraw(uint withdrawAmount) public {
        require(withdrawAmount <= 100000000000000000, "Maximum amount exceeded.");
        payable(msg.sender).transfer(withdrawAmount);
    }
}