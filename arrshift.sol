//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract ArrayRemoveByShifting{
    uint[] public arr;
    
    function remove(uint _index) public{
        require(_index < arr.length,"Index out of bound");
        for (uint i=_index; i<arr.length-1;i++){
            arr[i]=arr[i+1];// shifts the elements to the index before them
        }//we are not using delete as it only places the default value so arr length won't change
        arr.pop();//removes the last element as it is repititive
    }
    function test() external{
        arr=[1,2,3,4,5];
        remove(2);
    }
}
