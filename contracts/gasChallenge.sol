// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract gasChallenge {
    //Implement Fixed-Size Array Technique Here
    int256[] numbers;
    
    constructor() {
        numbers = new int256[](10);
        numbers[0] = 1;
        numbers[1] = 2;
        numbers[2] = 3;
        numbers[3] = 4;
        numbers[4] = -5;
        numbers[5] = -6;
        numbers[6] = -7;
        numbers[7] = -8;
        numbers[8] = -9;
        numbers[9] = 25;
    }
    
    //Function to check for sum of array
    //No changes required in this function
    function getSumOfArray() public view returns (int256) {
        int256 sum = 0;
        for (uint256 i = 0; i < numbers.length; i++) {
            sum += numbers[i];
        }
        return sum;
    }
    
    function notOptimizedFunction() public {
        for (uint i = 0; i < numbers.length; i++) {
            numbers[i] = 0;
        }
    }
    
    //Implement Remaining Gas Optimization Techniques Here
    //Sum of elements in the numbers array should equal 0
    
    function optimizedFunction() public {
      assembly {
            let length := sload(numbers.slot)
            let ptr := numbers.slot
            
            for { let i := 0 } lt(i, length) { i := add(i, 1) } {
                sstore(add(ptr, mul(i, 0x20)), 0)
            }
        }
    }
 }
