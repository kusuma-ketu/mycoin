// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {MyCoin} from "../src/mycoin.sol";

contract MyCoinTest is Test {

    uint256 initialSupply = 1_000_000 * 10 ** 18; 
    address initialOwner;
    MyCoin mycoin;

    function setUp() public {
        initialOwner = address(this);
        mycoin = new MyCoin(initialOwner, initialSupply);
    }

    function testInitialSupply() public view {
        assertEq(mycoin.totalSupply(), 1_000_000 * 10 ** 18);
        assertEq(mycoin.balanceOf(address(this)), 1_000_000 * 10 ** 18);
    }

    function testTransfer() public {
        address recipient = address(0x123);
        uint256 amount = 100 * 10 ** 18;
        mycoin.transfer(recipient, amount);
        assertEq(mycoin.balanceOf(recipient), amount);
    }
}


