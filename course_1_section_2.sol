/* IMPORTING CONTRACTS INTO ANOTHER CONTRACT */

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// import "./SimpleStorage.sol";
import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
    // type visibilty name
    SimpleStorage[] public listOfSimpleStorageContracts;

    function createSimpleStorageContract() public {
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        // Address
        // ABI - Application Binary Interface
        // SimpleStorage mySimpleStorage = SimpleStorage(listOfSimpleStorageAddresses[_simpleStorageIndex]); // typecasting
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        mySimpleStorage.store(_newSimpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
    }
}

/* CONCEPT OF INHERITANCE */

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

// Inheritance
contract AddFiveStorage is SimpleStorage {
    // +5 at Store Function
    // overrides
    // virtual override - add 'virtual' keyword to the original function to be overriden
    // function store(uint256 _favoriteNumber) public *virtual* {...}
    function store(uint256 _newNumber) public override {
        myFavoriteNumber = _newNumber + 5;
    }
}
