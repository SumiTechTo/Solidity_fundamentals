//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;


contract NFTCount {
    uint256 public numberOfNFTs; //here the variable has been declred public so that we can view it otherwise its best to keep sensitive info private
    //to check total no.of NFTs
    function checkTotalNFTs() public view returns(uint256){
        return numberOfNFTs;
    }
    //if a fucyion is declred as view then it cannot change the state of a varible 
    // returns(uint256) returns a value of data type -uint256

    //to increment no.of NFTs
    function addNFT() public {
        numberOfNFTs +=1;
    }

    //TO DECREMENT no.of NFTs
    function deleteNFT () public {
        numberOfNFTs-=1;
    }

    //here the functions have been kept public,later w will add logic to who can access the functions
}