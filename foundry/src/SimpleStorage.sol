// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18; // Would work in any version greater than or equal to given version

contract SimpleStorage {
    // Basic Types: boolean, uint, int, address, bytes
    // Max size of uint is 256 bits or 32 Bytes, written as uint256 or uint
    // address myAddress = 0x6016F9b663e3c4506206B9f777bFe204Efc87308;
    // bytes32 are strings in hex coding, bytes and bytes32 are not same
    
    // visibilty : internal or public or private or external
    uint256 myFavoriteNumber; // default value 0; boolean has 'false';

    // uint256[] listOfFavoriteNumbers; // [x,y,z]
    struct Person{
        uint256 favoriteNumber;
        string name;
    }

    // Person public matt = Person(13,"Matt");
    // Person public matt = Person({favoriteNumber: 13, name: "Matt"});
    // MAKE ARRAYS OF OBJECTS FOR STRUCTURE TO SOLVE REPEATED TASKS

    Person[] public listOfPeople; // dynamic array
    // Person[3] public listOfThreePeople; // static array

    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
        // uint256 testVar = 6;
        // Scope of local variables stays local
        // retrieve(); costs more gas
    }

    // keywords: view: equivalent to 'const' , pure: allows changing state
    function retrieve() public view returns(uint256) {
        return myFavoriteNumber;
    }
    /* 
        function retrieve() public pure  returns(uint256) {
            return 7;
        } 
    */
    
    // Mappings - avoiding loops for arrays; Default value is ZERO (acc to type mentioned)
    mapping(string => uint256) public nameToFavoriteNumber;

    // DATA ALLOCATION : STACK, MEMORY, STORAGE, CALLDATA, CODE, LOGS
    // CALLDATA & MEMORY: temporary allocated data, on RAM; MEMORY variable can be changed, CALLDATA variable is like const
    // STORAGE: Permanent Variables, can't be modified, on Storage Disk
    
    // not to be used for non-primitive types like uint, but for arrays, structs or mappings
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        // Person memory newPerson = Person(_favoriteNumber,_name);
        // listOfPeople.push(newPerson);
        // OR
        listOfPeople.push(Person(_favoriteNumber,_name));
        
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

    // Smart contract address on chain (eg): 0xD7ACd2a9FD159E69Bb102A1ca21C9a3e3A5F771B
}
