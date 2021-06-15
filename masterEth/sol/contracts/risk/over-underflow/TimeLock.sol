// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <=0.8.5;

contract TimeLock {
    mapping(address => uint256) public balance;
    mapping(address => uint256) public locktime;

    function deposit() public payable {
        balance[msg.sender] += msg.value;
        locktime[msg.sender] = block.timestamp + 1 weeks;
    }

    function increamLocktime(uint256 _secondToIncrease) public {
        locktime[msg.sender] += _secondToIncrease; //uint256 进行增加操作, 可能存在范围溢出
    }

    function withdraw() public {
        require(balance[msg.sender] > 0);
        require(block.timestamp > locktime[msg.sender]); //当出现locktime溢出后, 此条件始终是 true
        balance[msg.sender] = 0;
        payable(msg.sender).transfer(balance[msg.sender]);
    }
}
