// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <=0.8.4;

contract Owner {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier isOwner() {
        require(owner == msg.sender, "Only require owner");
        _;
    }
}

contract OwnerWithDecontruct is Owner {
    function destory() public isOwner {
        selfdestruct(payable(owner));
    }
}

contract FaucetTest is OwnerWithDecontruct {
    event Withdrawal(address indexed to, uint256 amount);
    event Deposit(address indexed from, uint256 amount);

    function withdraw(uint256 withdraw_amount) public {
        require(withdraw_amount <= 0.1 ether, "the max amount is 0.1 ether");
        require(
            address(this).balance >= withdraw_amount,
            " balance is not enough "
        );
        payable(msg.sender).transfer(withdraw_amount);
        emit Withdrawal(msg.sender, withdraw_amount);
    }

    // fallback() external payable {
    //     emit Deposit(msg.sender, msg.value);
    // }

    receive() external payable {
        // custom function code
        emit Deposit(msg.sender, msg.value);
    }
}
