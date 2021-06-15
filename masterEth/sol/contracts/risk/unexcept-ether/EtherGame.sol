// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <=0.8.5;

contract EtherGame {
    //触发条件1 合约收到总额为1ether
    uint256 public payoutMilestone1 = 1 ether;
    //满足条件一的奖励金额
    uint256 public milStone1Rewards = 3 ether;
    //触发条件2 合约收到总额为3ether
    uint256 public payoutMilestone2 = 3 ether;
    //满足条件二的奖励金额
    uint256 public milStone2Rewards = 5 ether;
    //触发条件3 合约收到总额为5ether
    uint256 public payoutMilestone3 = 5 ether;
    //满足条件三的奖励金额
    uint256 public milStone3Rewards = 10 ether;

    mapping(address => uint256) redeemableEther;
}
