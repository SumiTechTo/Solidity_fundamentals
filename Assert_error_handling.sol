//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract assertstatement {
    bool public result;

    function checkoverflow(uint256 _num1,uint256 _num2) public {
        uint256 sum= _num1+_num2;
        assert(sum<=255);//if
        result=true;//else
    }
}
