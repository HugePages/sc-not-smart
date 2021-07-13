// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <=0.8.6;

contract ModifierFunction {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // 自定义函数,可以用来修饰别的函数 pre-condition  对函数进行预先处理
    modifier ownerValidate() {
        require(msg.sender == owner);
        _; // 继续执行后续函数
    }

    function destory() public ownerValidate {
        // require(owner == msg.sender); //使用modifier指定function 代替部分代码, 方便通用代码复用
        selfdestruct((payable(owner)));
    }
}
