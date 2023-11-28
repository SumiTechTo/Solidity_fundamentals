//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract SimpleAuction{
//declaring state variables
address payable public beneficiary;
uint public auctionEndTime; //after this time no registration will tak place
address public highestBidder; //stores address of highest bidder
uint public highestBid; //value of highest bid

mapping(address=> uint) pendingReturns; //OutBids will be refunded
bool ended; //bydefault value is false

//events declaration.Events write information to the blockchain
event HighestBidIncrease(address bidder, uint amount);
event AuctionEnded(uint amount,address winner);

//Error declaration
error AuctionAlreadyEnded(); //occurs if the time has extended auctionEndTime value
error BidNotHighEnough (uint highestBid); //occurs if there is an equal or higher bid
error AuctionNotYetEnded (uint  timeToAuctionEnd); //the remaining seconds are displayed
error AuctionEndAlreadyCalled(); //the function auctionEnd has already been called

constructor(uint biddingTime, address payable _beneficiary){
 //constructors are called only once during deployment of the contract
beneficiary=_beneficiary;
auctionEndTime = block.timestamp+biddingTime;}

function bid() external payable { //defining a function as payable allows transactions to go through
if (block.timestamp>auctionEndTime){
revert AuctionAlreadyEnded();} //function call reverts if auction has ended

if (msg.value <=highestBid){
revert BidNotHighEnough(highestBid);} //transaction reverts back to the bidder if the bid does not exceed the highest one
//No direct refund is executed for security issues, instead the due amount is stored in the map to be //withdrwarn later

if (highestBid != 0) {//if bid surpasssed, then the bid of the former highest bidder is added to the amount to be returned
pendingReturns[highestBidder] += highestBid; }

//Updating the new highest bidder
highestBidder=msg.sender;
highestBid=msg.value;
emit HighestBidIncrease(msg.sender,msg.value);
}

function withdraw() external returns (bool){
uint amount= pendingReturns[msg.sender];
if (amount>0){
pendingReturns[msg.sender]=0;
if(!payable(msg.sender).send(amount)){
pendingReturns[msg.sender]=amount;
return false;}}
return true;
}
// payable(msg.sender).send(amount): This line attempts to send Ether (amount) to the address of the contract's message sender (msg.sender). The payable modifier is used to enable the conversion of the sender's address into a payable address, allowing it to receive Ether.

// !payable(msg.sender).send(amount): The ! (logical NOT) operator is used to check if the sending of Ether was unsuccessful. The send function returns false if the transfer fails.
// If the Ether transfer fails, the code inside the if block is executed.
// The pendingReturns[msg.sender] = amount; line stores the amount that failed to be sent in a mapping called pendingReturns. This mapping likely keeps track of funds owed to various addresses.
// The function then returns false, indicating that the transfer was not successful.
// Successful Transfer:
// If the Ether transfer is successful, the code after the if block is executed.
// The function returns true, indicating that the transfer was successful.

function auctionEnd() external{
if (block.timestamp<auctionEndTime){
revert AuctionNotYetEnded(auctionEndTime - block.timestamp);}
if (ended)
revert AuctionEndAlreadyCalled();
ended=true;
emit AuctionEnded(highestBid,highestBidder);
beneficiary.transfer(highestBid);
}
}
