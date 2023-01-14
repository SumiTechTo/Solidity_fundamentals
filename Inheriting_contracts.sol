//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract X{
    string public name;

    constructor (string memory _name){
        name=_name;
    }
}

contract Y{
    string public text;
    constructor (string memory _text){
        text=_text;
    }

}

contract B is X("Input to x"),Y("Input to Y"){//parent contract 
//contract X,Y will be inheriting the vlues from this 

}

contract C is X,Y{//same as B but we are taking user inputs
    constructor (string memory _name,string memory _text) X(_name) Y(_text){

    }
}

contract D is X,Y {
    constructor () X("X was called") Y("Y was called") {

    }
}

contract E is X,Y{
    constructor () Y("Y was called") X("X was called"){}
}
