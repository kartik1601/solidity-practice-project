// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18; // Would work in any version greater than or equal to given version

contract SimpleStorage {
    // Basic Types: boolean, uint, int, address, bytes
    // Max size of uint is 256 bits or 32 Bytes, written as uint256 or uint
    // address myAddress = 0x6016F9b663e3c4506206B9f777bFe204Efc87308;
    // bytes32 are strings in hex coding, bytes and bytes32 are not same
    
    // visibilty : internal or public or private or external
    uint256 public favoriteNumber; // default value 0; boolean has 'false';

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
        // uint256 testVar = 6;
        // Scope of local variables stays local
        // retrieve(); costs more gas
    }

    // keywords: view: equivalent to 'const' , pure: allows changing state
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }
    /* 
        function retrieve() public pure  returns(uint256) {
            return 7;
        } 
    */

    // Smart contract address on chain: 0xD7ACd2a9FD159E69Bb102A1ca21C9a3e3A5F771B
}
