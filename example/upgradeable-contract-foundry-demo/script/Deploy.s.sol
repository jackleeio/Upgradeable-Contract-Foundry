// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Script.sol";
import "../src/SimpleUpgrade.sol";
import "../src/Logic1.sol";

contract DeployScript is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        Logic1 logic1 = new Logic1();
        SimpleUpgrade proxy = new SimpleUpgrade(address(logic1));

        console.log("Logic1 deployed to:", address(logic1));
        console.log("Proxy deployed to:", address(proxy));

        vm.stopBroadcast();
    }
}
