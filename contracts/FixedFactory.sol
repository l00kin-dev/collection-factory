// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

import {FixedCollection} from "./FixedCollection.sol";

contract FixedFactory is Ownable {

    mapping(address => Collection[]) _ownedFixedCollections;

    struct Collection {
        address _address;
        string _name;
        string _symbol;
    }

    event FixedCollectioCreated(address);

    constructor() {}

    function createFixedCollection(string memory name_, string memory symbol_) external payable returns (address) {
        FixedCollection continiousCollection = new FixedCollection(name_, symbol_, msg.sender);
        _ownedFixedCollections[msg.sender].push(Collection(address(continiousCollection), name_, symbol_));
        emit FixedCollectioCreated(address(continiousCollection));
        return address(continiousCollection);
    }

    function getFixedCollection() external view returns (Collection[] memory) {
        return _ownedFixedCollections[msg.sender];
    }
}
