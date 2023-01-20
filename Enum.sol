
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

//enum-> enumerables

contract Enum{
    enum Status{
        Pending,//default value of Status
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }

    Status public status;

    //indexing in enum
    // Pending-0
    //Shipped-1
    //Accepted-2
    //Rejected-3
    //Cancelled-4

    function get() public view returns(Status){
        return status;
    }
    
    function update(Status _status) public{//index is passed into the func
        status=_status;
    }

    function cancel() public{
        status=Status.Canceled;
    }

    function reset() public{//resets the value to default
        delete status;
    }
}