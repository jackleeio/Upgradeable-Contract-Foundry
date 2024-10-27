// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Script.sol";
import "../src/Logic1.sol";

contract TestBeforeUpgradeScript is Script {
    function run() external {
        console.log("Caller address:", msg.sender);
        address proxyAddress = vm.envAddress("PROXY_ADDRESS");
        console.log("Proxy address:", proxyAddress);
        Logic1 proxy = Logic1(proxyAddress);

        console.log("Implementation address:", proxy.implementation());

        vm.startBroadcast();

        proxy.foo();
        console.log("Words after calling Logic1's foo():", proxy.words());

        vm.stopBroadcast();
    }
}
