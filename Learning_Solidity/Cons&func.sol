//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract trycontracts {
    string public hey;
    uint256 public no;
    //public keyword will help me see the value of variable on deploying

    constructor(string memory _hey,uint _no ){//called everytime the contract is deployed
        hey=_hey;
        no=_no;
    }

    function addinfo(string memory _hey,uint _no) public{//used to update the data
        hey=_hey;
        no=_no;
        }
}

//in java or pyhton programming we used to take user input to update or 
//add data ,here we use function parameters to accept values during deployment