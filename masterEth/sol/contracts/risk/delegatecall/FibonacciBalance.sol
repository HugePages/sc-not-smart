// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <=0.8.5;
import "./FibonacciLib.sol";

contract FibonacciBalance {
    address public fibonacciLib;
    uint256 public calculatedFibNumber;
    uint256 public start = 3; //设置起始值为3
    uint256 public withdrawalCouter;

    //函数引用

    constructor(address _fibonacciLib) payable {
        fibonacciLib = _fibonacciLib;
    }

    function withdraw() public {
        withdrawalCouter += 1;
        (bool status, ) =
            fibonacciLib.delegatecall(
                abi.encodePacked(
                    bytes4(keccak256("setFibonacci(uint256)")),
                    withdrawalCouter
                )
            );

        require(status);
        payable(msg.sender).transfer(calculatedFibNumber * 1 ether);
    }

    function falback() public {
        (bool status, ) =
            fibonacciLib.delegatecall(
                abi.encodePacked(bytes4(keccak256(msg.data)))
            );
        require(status);
    }
}
'