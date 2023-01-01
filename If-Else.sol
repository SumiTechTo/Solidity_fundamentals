//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract IFELSE{
    uint256 public myNum=5;
    string public myString;
    
     function get(uint256 _num) public returns (string memory){
         if (_num==5){
             myString ="Hey the value is 5";}
             else {
                 myString="NOT 5";
             }
         return myString;
     }

     function short(uint256 _num) public returns(string memory){
         return _num==5 ? myString="High 5":myString="No 5";
     }
}
//if else is same as other OOP languages