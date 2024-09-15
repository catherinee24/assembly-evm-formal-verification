# Rewriting solidity smart contracts in Huff
Rewriting in huff teaches how smart contracts work a the lowest level and provides deeper understanding of EVM Opcodes. Because the huff and solidity contracts should be identical you can write one test suite and apply it to both, known as a differential testing. 

### Starting to write our smart contract in Huff
```solidity 
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
```
Smart contract in Huff version
```Huff
// Asi es como definimos un macro en Huff que es basicamente una funcion 
// the takes(0) y el returns(0) se refiere 
#define macro MAIN() = takes(0) returns(0) {}
```
#### Commands 
- To see compilation
```bash
huffc src/horseStoreV1/HorseStore.huff
```
- to see the actual bytecode of the smart contract, by the moment we are not doing nothing 
```bash
huffc src/horseStoreV1/HorseStore.huff -b
-> 60008060093d393df3
```