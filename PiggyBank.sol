// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract PiggyBank {
    address payable public owner;
    event deposit(uint amount);
    event withdraw(uint amount);

    constructor() {
        owner = payable(msg.sender); 
    }
// withdraw from the piggy bank
    function withdrawPiggy() external payable {
        require(msg.sender == owner, "Only contract owner can withdraw");
        owner.transfer(address(this).balance);
        emit withdraw(address(this).balance);

    }
//withdraw and delete the contract
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