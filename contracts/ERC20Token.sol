// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ERC20Token is ERC20 {
  address payable immutable i_owner;

  constructor(uint256 initialSupply) ERC20("ERC20Token", "ERC") {
    i_owner = payable(msg.sender);
    _mint(msg.sender, initialSupply);
  }

  modifier onlyOwner() {
    require(msg.sender == i_owner);
    _;
  }

  function mint(uint256 _value) public onlyOwner {
    _mint(msg.sender, _value);
  }

  function burn(uint256 _value) public {
    _burn(msg.sender, _value);
  }
}
