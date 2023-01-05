//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract VendingMachine{

    address public owner;
    mapping (address=> uint)public donutBalances;

    constructor () {
        owner=msg.sender;
        donutBalances[address(this)] =100;//gives the balance of donut in the current address i.e in the owner's address
        //this keyword indicates the current address


    }
    function getVendingMachineBalance() public view returns(uint){
        return donutBalances[address(this)];
    }
    function restock(uint amount) public{
        require(msg.sender==owner,"Get Lost"); //adress running this function should be the owner's adress
        //so only owner can restock 
        donutBalances[address(this)]+=amount;

    }
    function Purchase(uint amount) public payable// used in functions where ether will be transacted
     {
         require(msg.value>=amount*0.001 ether,"inefficient funds");//msg.value gives us the payment incoming
         require(donutBalances[address(this)]>=amount,"Sorry!These doonuts deserve a better owner ");//to check that no.of donut in machine is sufficient for the purchase
         donutBalances[address(this)]-=amount;
         donutBalances[msg.sender]+=amount;

    }


}