// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract myContract{

    mapping(address => uint) AgetoAddress;

    function setAge(uint _age) public {
        AgetoAddress[msg.sender] = _age;
    }

    function getAge() public view returns(uint){
        return AgetoAddress[msg.sender];
    }
}