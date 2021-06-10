// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <=0.8.4;

contract FunctionFoo {
    address owner;

    //声明构造函数, 进行相应的处理
    constructor() {
        owner = msg.sender;
    }

    // 添加析构函数 用于提供给合约执行,删除此合约

    function destory() public {
        require(owner == msg.sender);
        selfdestruct((payable(owner)));
    }
}
