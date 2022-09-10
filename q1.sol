// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract myContract{

    uint sum;

    function setVal(uint _num1,uint _num2) public {
        sum = _num1 + _num2;
    }

    function getSum() public view returns(uint){
        return sum;
    }
}