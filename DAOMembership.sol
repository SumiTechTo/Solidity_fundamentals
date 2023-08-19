// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract DAOMembership {
    address public owner;
    mapping(address=>bool) public members;
    mapping(address=>bool) public applicants;
    address[] public arr;


   //To apply for membership of DAO
    function applyForEntry() public {
        require(members[msg.sender]==false && applicants[msg.sender]==false ,"You are already a member");
        applicants[msg.sender]=true;
        // arrapp.push(msg.sender);


    }
    
    //To approve the applicant for membership of DAO
    function approveEntry(address _applicant) public {
        require(members[msg.sender]&& applicants[_applicant] && msg.sender != _applicant ,"Only a member can enter");
         uint256 requiredApprovals = (arr.length * 30) / 100+1  ;
         uint256 approvals = 0;
          for (uint256 i = 0; i < arr.length; i++) {
         if (members[arr[i]]) {
                approvals++;
            }
          }


    require(approvals >= requiredApprovals, "Insufficient approvals");

    members[_applicant] = true;
    arr.push(_applicant);

    applicants[_applicant] = false;
        
    }

    //To check membership of DAO
    function isMember(address _user) public view returns (bool) {
        require(members[msg.sender] ,"You are not a member");
        return members[_user];
       
    }

    //To check total number of members of the DAO
    function totalMembers() public view returns (uint256) {
         require(members[msg.sender],"You are not a member");
         return arr.length;
    }
}
   //To apply for membership of DAO
    function applyForEntry() public {
        require(members[msg.sender]==false && applicants[msg.sender]==false ,"You are already a member");
        applicants[msg.sender]=true;
        // arrapp.push(msg.sender);


    }
    
    //To approve the applicant for membership of DAO
    function approveEntry(address _applicant) public {
        require(members[msg.sender]&& applicants[_applicant] && msg.sender != _applicant ,"Only a member can enter");
         uint256 requiredApprovals = (arr.length * 30) / 100+1  ;
         uint256 approvals = 0;
          for (uint256 i = 0; i < arr.length; i++) {
         if (members[arr[i]]) {
                approvals++;
            }
          }


    require(approvals >= requiredApprovals, "Insufficient approvals");

    members[_applicant] = true;
    arr.push(_applicant);

    applicants[_applicant] = false;
        
    }

    //To check membership of DAO
    function isMember(address _user) public view returns (bool) {
        require(members[msg.sender] ,"You are not a member");
        return members[_user];
       
    }

    //To check total number of members of the DAO
    function totalMembers() public view returns (uint256) {
         require(members[msg.sender],"You are not a member");
         return arr.length;
    }
}
