// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <=0.8.6;

contract Faucet {
    address owner = msg.sender;

    // Give out ether to anyone who asks
    function withdraw(uint256 withdraw_amount) public {
        // Limit withdrawal amount
        require(withdraw_amount <= 100000000000000000);

        // owner.transfer(withdraw_amount);
        // Send the amount to the address that requested it
        (payable(owner)).transfer(withdraw_amount);
    }

    // fallback() external payable{
    // custom function code
    // }

    receive() external payable {
        // custom function code
    }
}
