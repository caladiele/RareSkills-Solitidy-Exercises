// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract OneWeekLockup {
    /**
     * In this exercise you are expected to create functions that let users deposit ether
     * Users can also withdraw their ether (not more than their deposit) but should only be able to do a week after their last deposit
     * Consider edge cases by which users might utilize to deposit ether
     *
     * Required function
     * - depositEther()
     * - withdrawEther(uint256 )
     * - balanceOf(address )
     */

     mapping(address => uint256) public balances;

     uint256 private lastDeposit;

    function balanceOf(address user) public view returns (uint256) {
        // return the user's balance in the contract
        return balances[user];
    }

    function depositEther() external payable {
        balances[msg.sender] += msg.value;
        if(msg.value != 0) {
            lastDeposit = block.timestamp;
        }
        /// add code here
    }

    function withdrawEther(uint256 amount) external {
        require(balances[msg.sender] >= amount && block.timestamp >= lastDeposit + 1 weeks , "Nope");
        msg.sender.call{value: amount}("");
        balances[msg.sender] -= amount;
        /// add code here
    }
}
