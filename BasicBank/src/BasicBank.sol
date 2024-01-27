// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract BasicBank {
    /// @notice deposit ether into the contract
    /// @dev it should work properly when called multiple times

    mapping(address => uint256) public balanceOf;
 
    receive() external payable {}

    function addEther() external payable {
        balanceOf[msg.sender] += msg.value;
    }

    /// @notice used to withdraw ether from the contract (No restriction on withdrawals)
    function removeEther(uint256 amount) external payable {

        require(balanceOf[msg.sender] >= amount, "Nope ;)");
        msg.sender.call{value: amount}("");
        balanceOf[msg.sender] -= amount;
        
    }
}
