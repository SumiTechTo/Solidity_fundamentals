//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;
    //events help you log data onto the blockchain 

contract Event{

    //in events there can be only 3 indexed elemnts
    //indexing helps you to find the parameters easily  
    event Message(address indexed _from,address indexed _to,string message);
   
   function sendMessage(address _to,string calldata _message) external{
       emit Message(msg.sender,_to,_message);
   }//using this function we can send a message to anyone on the blockchain

    }
