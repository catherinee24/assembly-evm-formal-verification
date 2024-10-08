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
-> 60008060093d393df3 -> contract creation bytecode 
```
### Smart contract bytecode 
**Most compiled contracts have 3 sections**
- Contract creation
- Runtime 
- Metadata 
The **EVM** adds **INVALID** Opcodes between the sections so its even esier to tell which section is which
So after contract creation they put a **INVALID** and so on..

### What Contract creation bytecode does?
Hey, take the binary after me and stick it on-chain.
- Hey, toma el binario después de mí y ponlo en la cadena

### CODECOPY Instruction EVM
**CODECOPY** is a tool to copy a specific part of your contract's code into memory and use it in other operations.
**39 CODECOPY**: in our obteined bytecode `60008060093d393df3` we can see this instrucctionn 600080600 93 **39** 3df3


