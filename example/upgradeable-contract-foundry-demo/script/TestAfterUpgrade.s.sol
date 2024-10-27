// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Script.sol";
import "../src/Logic2.sol";

contract TestAfterUpgradeScript is Script {
    function run() external {
        address proxyAddress = vm.envAddress("PROXY_ADDRESS");
        Logic2 proxy = Logic2(proxyAddress);

        vm.startBroadcast();

        proxy.foo();
        console.log("Words after calling Logic2's foo():", proxy.words());
        console.log("Current implementation address:", proxy.implementation());

        vm.stopBroadcast();
    }
}
