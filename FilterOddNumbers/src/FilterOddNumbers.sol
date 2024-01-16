// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract FilterOddNumbers {
    /*
        This exercise assumes you understand how to manipulate Array.
        1. Function `filterOdd` takes an array of uint256 as argument. 
        2. Filter and return an array with the odd numbers removed.
        Note: this is tricky because you cannot allocate a dynamic array in memory, 
              you need to count the even numbers then declare an array of that size.
    */

    function filterOdd(uint256[] memory _arr) public pure returns (uint256[] memory) {
        /*
            First, determine the length of the return array.
        */
        uint256 arrLength = 0;

        for (uint i = 0; i < _arr.length; i++) {
            if (_arr[i] % 2 == 0) {
                arrLength++;
            }
        }
        /*
            Next, create an array with a fixed length, 
            equal to the number of even numbers in the input array (_arr)
        */
        uint[] memory filteredArray = new uint[](arrLength);

        /* Initialize a counter, useful to assign values to the right slot */
        uint j;

        /*
            New for loop, for each value corresponding to the condition ->
            assign the value to the first available slot in the return array.
            Last, increment counter.
        */
        for (uint i = 0; i < _arr.length; i++) {
            if (_arr[i] % 2 == 0 ) {
                filteredArray[j] = _arr[i];
                j++;
            }
        }

        return filteredArray;

    }
}
