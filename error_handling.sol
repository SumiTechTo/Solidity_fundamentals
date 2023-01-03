//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract Require{
    function checkinput (uint256 _input) public view returns( string memory){
        require(_input>=0, "invalid uint8");//ita like if-else . 
        require (_input<=255,"invalid uiint8");
        // if 0<=_input<=255 ok. Else print the message

        return "Input is uint8";
    }

    function odd(uint256 _input) public view returns(bool){
        require (_input%2!=0);
        return true;
        // if _input%2!=0 it will return true else it will return error.
    }
}