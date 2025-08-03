// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "lib/openzeppelin-contracts/contracts/access/Ownable.sol";
//import "lib/openzeppelin-contracts/contracts/security/Pausable.sol";
//import "lib/openzeppelin-contracts/contracts/token/ERC20/extensions/ERC20Snapshot.sol";

contract MyCoin is ERC20, Ownable {

    event TokensMinted(address indexed to, uint256 amount);
    event TokensBurned(address indexed from, uint256 amount);

    constructor(address initialOwner, uint256 initialSupply) ERC20("MyCoin", "MYC") Ownable(initialOwner) {
        _mint(msg.sender, initialSupply * 10 ** decimals());
    }

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
        emit TokensMinted(to, amount);
    }

    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
        emit TokensBurned(msg.sender, amount);
    }

}
