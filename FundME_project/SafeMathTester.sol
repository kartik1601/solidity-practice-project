// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract SafeMathTester{
    uint8 public bigNumber = 255; // checked by SAFE_MATH

    function add() public {
        bigNumber = bigNumber + 1;
        unchecked {bigNumber = bigNumber + 1;} // gas efficient
    }
}