// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import "../src/MyCoin.sol";
import "forge-std/console.sol";

contract Deploy is Script {
    function run() external returns (MyCoin coin) {
        uint256 pk = vm.envUint("PRIVATE_KEY"); // put a throwaway key in .env
        address owner = vm.addr(pk);
        console.log("Deployed to: %s", address(coin));
        vm.startBroadcast(pk);
        coin = new MyCoin(owner, 1000000);
        vm.stopBroadcast();
    }
}