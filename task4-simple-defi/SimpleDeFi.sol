// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleDeFi {

    mapping(address => uint) public balances;

    // Deposit ETH
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    // Withdraw ETH (fixed version)
    function withdraw(uint _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance");

        balances[msg.sender] -= _amount;

        (bool success, ) = payable(msg.sender).call{value: _amount}("");
        require(success, "Transfer failed");
    }

    // Check balance
    function getBalance() public view returns (uint) {
        return balances[msg.sender];
    }
}
