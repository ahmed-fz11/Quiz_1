// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract myContract{
    address public owner;
    address[] adrarr;
    constructor()  {
        owner = msg.sender;
    }

    modifier onlyAdmin{
        require(msg.sender == owner);
        _;
    }
    mapping(address => student) public AddresstoDetails;

    struct student{
        string name;
        uint age;
        uint marks;
        string gender;
        uint class;
    }

    function updateDetails(string memory _name,uint _age,uint _marks,string memory _gender,uint _class,address _addr) public onlyAdmin{
        AddresstoDetails[_addr].name = _name;
        AddresstoDetails[_addr].age = _age;
        AddresstoDetails[_addr].marks = _marks;
        AddresstoDetails[_addr].gender = _gender;
        AddresstoDetails[_addr].class = _class;
        adrarr.push(_addr);
    }

    function getDetails(address _addr) public view returns(string memory,uint,uint,string memory,uint){
        return (AddresstoDetails[_addr].name,AddresstoDetails[_addr].age,AddresstoDetails[_addr].marks,AddresstoDetails[_addr].gender,AddresstoDetails[_addr].class);
    }
    student[] stdstructarr;
    uint arraylength = adrarr.length;
    function populate_student_arr() public returns(student[] memory){
        for(uint i=0;i <= arraylength;i++) {
            stdstructarr.push(AddresstoDetails[adrarr[i]]);
        }
        return stdstructarr;
    }

    uint result;
    uint index;
    function returnHighest_details() public returns(string memory,uint,uint,string memory,uint){
        for(uint i=0; i <= arraylength; i++){
            if(AddresstoDetails[adrarr[i]].marks > result){
                result = AddresstoDetails[adrarr[i]].marks;
                index = i;
            }
        }
        return((AddresstoDetails[adrarr[index]].name,AddresstoDetails[adrarr[index]].age,AddresstoDetails[adrarr[index]].marks,AddresstoDetails[adrarr[index]].gender,AddresstoDetails[adrarr[index]].class));
    }
        function returnLowest_details() public returns(string memory,uint,uint,string memory,uint){
        for(uint i=0; i <= arraylength; i++){
            if(AddresstoDetails[adrarr[i]].marks < result){
                result = AddresstoDetails[adrarr[i]].marks;
                index = i;
            }
        }
        return((AddresstoDetails[adrarr[index]].name,AddresstoDetails[adrarr[index]].age,AddresstoDetails[adrarr[index]].marks,AddresstoDetails[adrarr[index]].gender,AddresstoDetails[adrarr[index]].class));
    }
}