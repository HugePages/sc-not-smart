// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <=0.8.5;

// \         CodeisLaw         /
//   \    --------------     /
//    ]     Blockchain      [    ,'|
//    ]                     [   /  |
//    ]___               ___[ ,'   |
//    ]  ]\             /[  [ |:   |
//    ]  ] \           / [  [ |:   |
//    ]  ]  ]         [  [  [ |:   |
//    ]  ]  ]__     __[  [  [ |:   |
//    ]  ]  ] ]\ _ /[ [  [  [ |:   |
//    ]  ]  ] ] (#) [ [  [  [ :===='
//    ]  ]  ]_].nHn.[_[  [  [
//    ]  ]  ]  HHHHH. [  [  [
//    ]  ] /   `HH("N  \ [  [
//    ]__]/     HHH  "  \[__[
//    ]         NNN         [
//    ]         N/"         [
//    ]         N H         [
//   /          N            \
//  /           q,            \
// /                           \

contract FibonacciLib {
    uint256 public start; // 代码库中存储了 状态值,所有的调用者可以共享  存储在slot[0]
    uint256 public calculatedFibNumber; //存储在slot[1] 中

    function setStart(uint256 _start) public {
        start = _start;
    }

    function setFibonacci(uint256 n) public {
        calculatedFibNumber = fibonacci(n);
    }

    function fibonacci(uint256 n) internal returns (uint256) {
        if (n == 0) {
            return start;
        } else if (n == 1) {
            return start + 1;
        } else {
            return fibonacci(n - 1) + fibonacci(n - 2);
        }
    }
}
