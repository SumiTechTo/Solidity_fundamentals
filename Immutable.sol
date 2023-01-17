// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Immutable {
    
    address public immutable MY_ADDRESS;
    uint public immutable MY_UINT;

    constructor(uint _myUint) {
        MY_ADDRESS = msg.sender;
        MY_UINT = _myUint;
    }
}

//works just ike constant 
//but value can be assigned by the owner/user, even though only once 
//helpful when you don't want the value to change after deploying 
