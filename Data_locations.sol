// There aree 3 types of data location in Solidity ->
// 1. Storage-> Stored on the blockchain eg.state variables
                // Can be used to update data
// 2.Memory -> Stored in the functions 
// 3.Calldata->stored in locations that contains function arguments 
                // Avoids use of excess space as it passes the argument without copying

//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract DataLocation{
    uint[] public arr;
  

    struct MyStruct{
        uint foo;
        string text;
    }
    mapping (uint=> MyStruct) public map;

    function example(uint _i) public {
        map[_i]=MyStruct({foo:123,text:"abcd"});

        MyStruct storage myvar = map[_i];
        // myvar.text="changes";
        // map[_i].text="changes";
        //it seems like myvar is pointing towards the address of map[arg]

        MyStruct memory readOnly = map[_i];
        readOnly.foo=456;//doesn't update
    }
    
}