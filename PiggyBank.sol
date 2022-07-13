// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract PiggyBank {
    address public owner;
    event deposit(uint amount);
    event withdraw(uint amount);

    constructor(){
        owner = msg.sender; 
    }
// withdraw from the piggy bank
    function breakPiggy()  external {
        require(msg.sender == owner, "Only contract owner can break the piggy");
        emit withdraw(address(this).balance);
        selfdestruct(payable(msg.sender));

    }
//deposit to the piggy bank by sending tokens to the smart contract address
    receive() external payable {
        emit deposit(msg.value);

    }
}