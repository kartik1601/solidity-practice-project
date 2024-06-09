// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Fallback {
    uint256 public result;

    // doesn't work with CALLDATA
    receive() external payable {
        result = 1; // executed when a transaction is committed
    }

    fallback() external payable {
        result = 2; // executed like receive() but also when there is some data inputted
    }
}

//            msg.data == empty ?
//                /        \
//               yes        no
//               /           \
//          receive() ?    fallback()
//           /    \              
//         yes    no
//         /       \
//    receive()    fallback()