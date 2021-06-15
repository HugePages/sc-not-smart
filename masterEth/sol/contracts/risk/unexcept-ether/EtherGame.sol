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

    uint256 public balanceTmp = 0;
    mapping(address => uint256) redeemableEther;

    function play() public payable {
        require(msg.value == 0.5 ether);
        uint256 currentBalance = balanceTmp + msg.value;

        require(currentBalance <= payoutMilestone3);

        if (currentBalance == payoutMilestone1) {
            redeemableEther[msg.sender] += milStone1Rewards;
        }
        if (currentBalance == payoutMilestone2) {
            redeemableEther[msg.sender] += milStone2Rewards;
        }
        if (currentBalance == payoutMilestone3) {
            redeemableEther[msg.sender] += milStone3Rewards;
        }
        balanceTmp += msg.value;
        return;
    }

    function claimReward() public {
        require(balanceTmp == milStone3Rewards);
        require(redeemableEther[msg.sender] > 0);
        redeemableEther[msg.sender] = 0;
        payable(msg.sender).transfer(milStone3Rewards);
    }
}
