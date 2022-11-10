//SPDX-License-Identifier: Unlicense 
pragma solidity ^0.8.0;

contract Whitelist {
    uint8 public maxWhitelistedAddresses;
    uint8 public numAddressesWhitelisted;

    mapping(address => bool) public whitelistedAddresses;

    constructor(uint8 _maxWhitelestedAddresses) {
        maxWhitelistedAddresses = _maxWhitelestedAddresses;
    }
    
    function addAddressToWhitelist() public {
        require(!whitelistedAddresses[msg.sender], "Sender already has been whitelisted");
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "Whitelist is already full!");
        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted += 1;
        
    }
}