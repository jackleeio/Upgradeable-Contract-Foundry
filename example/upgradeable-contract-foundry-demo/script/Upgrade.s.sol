// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Script.sol";
import "../src/SimpleUpgrade.sol";
import "../src/Logic2.sol";

contract UpgradeScript is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address proxyAddress = vm.envAddress("PROXY_ADDRESS");

        vm.startBroadcast(deployerPrivateKey);

        Logic2 logic2 = new Logic2();
        SimpleUpgrade proxy = SimpleUpgrade(payable(proxyAddress));

        console.log("Logic2 deployed to:", address(logic2));
        console.log("Current implementation:", proxy.implementation());
        console.log("New implementation address:", address(logic2));

        proxy.upgrade(address(logic2));
        console.log("Proxy upgraded to Logic2");

        vm.stopBroadcast();
    }
}
