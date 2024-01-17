// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract IsSorted {
    /**
     * The goal of this exercise is to return true if the members of "arr" is sorted (in ascending order) or false if its not.
     */
    function isSorted(uint256[] calldata arr) public view returns (bool) {
        uint j = 0;
        for (uint i = 0; i < arr.length; i++) {
            if (arr[i] < j) {
                return false;
            }
            j = arr[i];
        }
        return true;
    }
}
