// SPDX License Identifier: MIT
pragma solidity ^0.8.18;

// DONT USE ENV
// USE: cast wallet import "nameOfTheKey" --interactive
// npx thirdweb deploy

import {Script} from "forge-std/Script.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";

contract DeploySimpleStorage is Script {
    function run() external returns(SimpleStorage){
        vm.startBroadcast(); // Special keyword from Script.sol 
        /* TRANSACTIONS IN BETWEEN */
        SimpleStorage simpleStorage = new SimpleStorage();
        vm.stopBroadcast();
        
        return simpleStorage;
    }
}