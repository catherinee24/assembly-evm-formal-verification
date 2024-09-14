//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract HorseStore {
    uint256 numberOfHorses;

    function updateHorsesNumber(uint256 newHorsesNumber) public {
        numberOfHorses = newHorsesNumber;
    }

    function readNumberOfHorses() public view returns (uint256) {
        return numberOfHorses;
    }
}