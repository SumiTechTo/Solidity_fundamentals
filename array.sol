//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract Array {
    uint[] public arr;
    uint[] public arr2=[1,2,3];
    uint[10] public fixsizearr;

    function get(uint i) public view returns (uint){
        return arr[i];
    }//i is the index

    function get() public view returns(uint[] memory){
        return arr;
    }
    function push(uint i) public{//increases the array size by 1
        arr.push(i);
    }//i is the value here we want to add to the array
    function pop() public{//reduces the array size by 1
        arr.pop();

    }

    function getLen() public view returns(uint){
        return arr.length;
    }
    function remove(uint i) public {//changes the value to default so no reduction in array size 
        delete arr[i];
    } 

    //External/Internal??
}