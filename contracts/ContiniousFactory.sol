// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

import {ContiniousCollection} from "./ContiniousCollection.sol";

contract ContiniousFactory is Ownable {

    mapping(address => Collection[]) _ownedContiniousCollections;

    struct Collection {
        address _address;
        string _name;
        string _symbol;
    }

    event ContiniousCollectioCreated(address);

    constructor() {}

    function createContiniousCollection(string memory name_, string memory symbol_) external payable returns (address) {
        ContiniousCollection continiousCollection = new ContiniousCollection(name_, symbol_, msg.sender);
        _ownedContiniousCollections[msg.sender].push(Collection(address(continiousCollection), name_, symbol_));
        emit ContiniousCollectioCreated(address(continiousCollection));
        return address(continiousCollection);
    }

    function getContiniousCollection() external view returns (Collection[] memory) {
        return _ownedContiniousCollections[msg.sender];
    }
}
