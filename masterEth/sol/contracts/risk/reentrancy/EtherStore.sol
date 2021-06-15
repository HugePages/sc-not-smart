// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <=0.8.5;

contract EtherStore {
    uint256 public withdrawLimit = 1 ether;

    mapping(address => uint256) public lastWithdrawTime;
    mapping(address => uint256) public balance;

    //存款操作,给交易发起者进行 balance 的增加操作
    function depositFunds() public payable {
        balance[msg.sender] += msg.value;
    }

    //消费资产, 消耗当前交易发起者余额,并且只允许一周消费一次
    function withdraw(uint256 _weiToWithdraw) public payable {
        require(balance[msg.sender] >= _weiToWithdraw, "balance is not enough");
        require(
            _weiToWithdraw <= withdrawLimit,
            " withdraw amount is greater than limit "
        );
        require(block.timestamp >= lastWithdrawTime[msg.sender] + 1 weeks);
        // require(msg.sender.call.value(_weiToWithdraw)()); //新版本要求使用{value:}代替value()
        (bool success, ) = msg.sender.call{value: _weiToWithdraw}(""); //⚠️这个代码会触发调用合约的fallback函数  解决方案,现在资源处理,在进行调用
        require(success);
        //解决方案 1. 下面代码移到call.value之前,先转钱,后调用
        //2. 使用transfer代替call.value
        //3.对共享资源加锁,使用互斥锁 mutex

        balance[msg.sender] -= _weiToWithdraw;
        lastWithdrawTime[msg.sender] = block.timestamp;
    }
}
