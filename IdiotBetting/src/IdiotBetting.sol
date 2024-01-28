// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract IdiotBettingGame {
    /*
        This exercise assumes you know how block.timestamp works.
        - Whoever deposits the most ether into a contract wins all the ether if no-one 
          else deposits after an hour.
        1. `bet` function allows users to deposit ether into the contract. 
           If the deposit is higher than the previous highest deposit, the endTime is 
           updated by current time + 1 hour, the highest deposit and winner are updated.
        2. `claimPrize` function can only be called by the winner after the betting 
           period has ended. It transfers the entire balance of the contract to the winner.
    */

    mapping(address => uint256) public balances;
    address public winner;

    uint256 public higherBet;
    uint256 public lastBet;

    receive() external payable{}

    function bet() public payable {

        balances[msg.sender] = msg.value;

        if (lastBet == 0 || higherBet < msg.value) {
            lastBet = block.timestamp;
            higherBet = msg.value;
            winner = msg.sender;
        }

    }

    function claimPrize() public payable {

        require(lastBet != 0 && 
                block.timestamp >= lastBet + 1 hours && 
                winner == msg.sender, "Nope");

        msg.sender.call{value: address(this).balance}("");

    }
}
