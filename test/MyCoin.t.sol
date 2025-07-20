// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {MyCoin} from "../src/mycoin.sol";

contract MyCoinTest is Test {

    MyCoin mycoin;

    function setUp() public {
        token = new mycoin(1_000_000 * 10 ** 18);
    }

    function testInitialSupply() public {
        assertEq(token.totalSupply(), 1_000_000 * 10 ** 18);
        assertEq(token.balanceOf(address(this)), 1_000_000 * 10 ** 18);
    }

    function testTransfer() public {
        address recipient = address(0x123);
        uint256 amount = 100 * 10 ** 18;
        token.transfer(recipient, amount);
        assertEq(token.balanceOf(recipient), amount);
    }
}


