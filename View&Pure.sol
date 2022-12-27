//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract VP{
    
    uint256 Num1=2;
    uint256 Num2=5;

    function getResultV() public view returns (uint256,uint256)
    {
        return(Num1,Num2);
    }//in view we can access values of state variables and local variables

    function useStateV() public view returns(uint256 product,uint256 sum){
         product=Num1*Num2;
         sum=Num1+Num2;

    }//if we dont use return we won't be seeing the value upon deployment 

    function useState1V() public view returns(uint256 product ,uint256 sum){
        // uint256 product=0;
        // uint256 sum=0; //Why is the ans=0 here?
        product =Num1*Num2;
        sum=Num1+Num2;

        product=Num1*Num1;
        sum=Num1+Num1;
        

    }//we can calculate using state variables in view but can't change the state variables
    //without the view keyword the result is shown in the logs and not in the deployed window 
    
    
    function getDataP() public pure returns(uint256 lvar1,uint256 lvar2){
        lvar1=100;
        lvar2=500;
    }//pure can only access local variable

    
}