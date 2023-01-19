//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
//mapping is a state variable
//Syntax:  mapping(keyType => valueType)
//keyType can be anything
// valueType can be mapping or array
//Mappings are not iterable

contract Mapping{
    //maps address to uint

    mapping(address =>uint) public myMap;

    function get (address _addr) public view returns(uint){//takes address and returns id no. of particular user
        //mapping always returns a value ,even if you don't define it 
        return myMap[_addr];
    }

    function set(address _addr,uint _i) public{
            myMap[_addr]=_i;
    }
    function remove(address _addr) public {
        delete myMap[_addr];
    }
}

contract NestedMapping{
    mapping(address =>mapping (uint=>bool)) public nest;

    function get(address _addr1, uint _i) public view returns(bool){
        return nest[_addr1][_i];

        //if the address & Id of user present then returns true else returns false
    }
    function set (address _addr1, uint _i,bool _boo)public{
        nest[_addr1][_i]=_boo;
    }
    function remove (address _addr,uint _i) public {
        delete nest [_addr][_i];
    }
    }

