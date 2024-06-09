// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {PriceConverter} from "./PriceConverter.sol";

// Custom errors - replace require's data field with something constant, to reduce gas
error CriteriaFailed();
error NotOwner();

/*
    Get Funds from users
    Withdraw funds
    Set a minimum funding value in USD
*/

// Reducing the GAS of the contract- using constant and immutable keywords
contract FundMe {
    // To use its method in the contract
    // All uint256(s) have access to all the functions it can define
    using PriceConverter for uint256;

    uint256 public constant MINIMUM_USD = 5e18;

    // List of funders in the application, mapped to their ETH amount funded
    address[] public funders;
    mapping(address funder => uint256 amtFunded) public addToAmtFunded;
    
    address public immutable i_owner;

    // CONSTRUCTOR
    constructor() {
        i_owner = msg.sender;
    }

    // payable keywords will make this function appear red
    // it allows the function to take transactions
    function fund() public payable {
        // Allow users to send $
        // Have a minimum $ amount to be sent
        
        // myValue = myValue + 2;
        if(msg.value.getConversionRate() < MINIMUM_USD){
            revert CriteriaFailed();
        } // no of wei (1 wei = 1e-18 ETH) sent with the msg
        // if a ton of computation below - if reverts - remaining gas sent back
        // REVERT - undo any actions that have been done and send the remaining gas back
        funders.push(msg.sender);
        addToAmtFunded[msg.sender] = addToAmtFunded[msg.sender] + msg.value;
    }

    function withdraw() public onlyOwner {
        // require(msg.sender == i_owner, "Must be i_owner!"); saved by a modifier
        // Loop - 0-indexed array
        // for(startIdx,endIdx,stepAmt)

        for(uint256 funderIdx=0 ; funderIdx < funders.length ; funderIdx++){
            address funder = funders[funderIdx];
            addToAmtFunded[funder] = 0;
        }
        // reset the funders array
        funders = new address[](0);
        
        // withdraw the funds
            // transfer(2300 gas, throws error)
            // msg.sender = address
            // payable(msg.sender) = payable address
        // payable(msg.sender).transfer(address(this).balance);
            // send(2300 gas, returns bool)
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send Failed!"); 
            // call - lower level command, dont need ABI
            // also returns:- bytes memory dataReturned
            // call(forward all gas or set gas, returns bool)
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        if(callSuccess == false){
            revert CriteriaFailed();
        }
    }

    modifier onlyOwner() {
        if(msg.sender != i_owner){
            revert NotOwner();
        }
        _; // function body, execute the code after the above code, hence its position is important
    } 

    // Sending ETH without FUND function
    // receive() : Atmost 1, w/o function keyword, no arguments, no return type and external visibilty & payable mutability are must
    // fallback() : Atmost 1, can take calldata, w/o function keyword, must have external visibility

    // If someone sends transaction without fund function, then it will be routed to fund
    receive() external payable {
        fund();
    }
    fallback() external payable {
        fund();
    }
}