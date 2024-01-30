// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract ReducingPayout {

    uint256 public immutable depositedTime;
    uint256 public howManySecondsSinceDeposit;
    uint256 public withdrawVal;

    constructor() payable {
        depositedTime = block.timestamp;
    }

    function withdraw() public {

        howManySecondsSinceDeposit = block.timestamp - depositedTime;
        uint256 totalBalance = address(this).balance;
        uint256 isWithdrawable = totalBalance;

        if (howManySecondsSinceDeposit >= 24 hours) {
            withdrawVal = 0;
        } else {
         withdrawVal = address(this).balance - ((howManySecondsSinceDeposit * 0.0011574 ether) / 100);
        }

        msg.sender.call{value: withdrawVal}("");
           
    }
}
