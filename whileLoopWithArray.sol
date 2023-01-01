//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract whileloop{
    uint256[] data;
    uint8 k=0;
    
    function loop() public returns (uint256[] memory)//array is returned in (datatype[] memory)
    {
        while(k<5){
            k++;
            data.push(k); //to add element into an array we use the push function
        }
        return data;
    }
    
      }
//while(condition){Syntax to be performed}

