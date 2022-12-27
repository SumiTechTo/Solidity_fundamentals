//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
//without nested functions
contract EventTicket{
    uint256 public numberOfTicket;
    uint256  ticketPrice;
    uint256 public totalAmount;
    uint256  startAt;
    uint256  endAt;
    uint256  timeRange;
    string public message ="Buy Your First EVENT ticket!";
    uint256 public TotalnumberOfTicket;

    constructor (uint256 _ticketPrice){
        ticketPrice=_ticketPrice;
        startAt=block.timestamp;//gives the timestamp of the current block
        endAt=block.timestamp + 7 days;//we are giving 7 day validity 
        timeRange=(endAt-startAt)/60/60/24; //converted seconds to days
    }
    function getTicket(uint256 _numberOfTicket) public {//assigns no.of ticket bought to a state variable
        numberOfTicket=_numberOfTicket;
        
    }

    function buyTicket() public  {//updating function 
        TotalnumberOfTicket=numberOfTicket+numberOfTicket;//total no.of ticket sold
        totalAmount =totalAmount+(numberOfTicket*ticketPrice); //totAL amount of ticket purchased
        
        
    }
    function getBill()public view returns(uint256 AmountToBePaid,uint256 ticketID){//to generate the bill
         AmountToBePaid=numberOfTicket*ticketPrice;
         ticketID= AmountToBePaid+numberOfTicket+startAt;
    }
}
