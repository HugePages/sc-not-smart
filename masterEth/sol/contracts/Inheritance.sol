// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <=0.8.6;
import "./ModifierFunction.sol"; // 引入依赖的sol对象合约

contract Sun is ModifierFunction {
    function inheritanceFn() public ownerValidate {}
}
