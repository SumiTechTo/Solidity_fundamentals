//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract GLOBAL {
    address public owner;
    address public myBlockHash;
    uint256 public difficulty;
    uint256 public gasLimit;
    uint256 public number;
    uint256 public timestamp;
     uint256 public value;
     uint256 public nowOn;
    address public origin;
     uint256 public gasprice;
    bytes public callData;
    bytes8 public FirstFour;

    constructor (){
        owner= msg.sender;
        //gets the address of the deploying wallet and assigns it to the variable

        myBlockHash= block.coinbase;
        difficulty= block.difficulty;
        gasLimit= block.gaslimit;
        number= block.number;
        timestamp=block.timestamp;
        gasprice=tx.gasprice;
        origin=tx.origin;
        callData=msg.data;
        FirstFour=msg.sig;

    }
}