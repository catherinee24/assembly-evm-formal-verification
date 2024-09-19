### What is the `EQ`(14) Opcode in the EVM?

The `EQ` opcode in the Ethereum Virtual Machine (EVM) is an instruction used to compare two values to see if they are equal.

### How It Works

1. **Stack:** The EVM uses a stack to store temporary data. Values are pushed onto the stack and popped from it to perform operations.

2. **Comparison:** When `EQ` is executed, it takes the two values at the top of the stack and compares them. If the values are equal, `EQ` pushes `1` (true) onto the stack. If they are not equal, it pushes `0` (false).

3. **Result:** The result of the comparison is left at the top of the stack for further use.

---

### Simple Example

Let's say we want to compare if two numbers are equal. Suppose the numbers are `5` and `7`.

#### EVM Opcode Code

Here is the EVM code to perform this comparison:

#### Detailed Steps

1. **PUSH1 05**: Pushes `5` onto the stack.
   - **Stack**: `[5]`
   
2. **PUSH1 07**: Pushes `7` onto the stack.
   - **Stack**: `[7, 5]`
   
3. **EQ**: Compares `7` and `5`.
   - Since `7` is not equal to `5`, `EQ` pushes `0` onto the stack.
   - **Stack**: `[0]`

### Summary

- **Opcode `EQ`**: Compares two values on the stack.
- **Result**: Pushes `1` if the values are equal and `0` if they are not.
- **Usage**: Useful in smart contracts to make decisions based on value equality.

---

## What are `JUMP` and `JUMPI` Opcodes in the EVM?

The `JUMP` and `JUMPI` opcodes in the Ethereum Virtual Machine (EVM) are used to control the flow of execution in smart contracts, allowing you to jump to different parts of the code.

### How They Work

1. **`JUMP` Opcode (56)**
   - **Purpose**: `JUMP` is used to jump to a specific location in the code.
   - **Operation**: It reads the address from the stack and jumps to that position in the code.
   - **Use Case**: You use `JUMP` when you want to go to a specific point in your code unconditionally.

2. **`JUMPI` Opcode (57)**
   - **Purpose**: `JUMPI` performs a conditional jump.
   - **Operation**: It reads an address from the stack and a condition. If the condition is true (i.e., not zero), it jumps to the specified address.
   - **Use Case**: You use `JUMPI` when you want to jump to a certain part of your code only if a specific condition is met.

### Simple Example

Imagine you have a small piece of code where you want to jump to different parts based on a condition.

#### EVM Opcode Code

```solidity
PUSH1 01   ; Push the value 1 (condition) onto the stack
PUSH1 10   ; Push the address 16 (0x10) to jump to onto the stack
JUMPI       ; Conditionally jump to address 16 if the condition is not zero

PUSH1 00   ; This is the code at address 0
POP         ; Pop the value (not used in this example)

PUSH1 11   ; This is the code at address 16
JUMP        ; Jump to address 17 (next instruction)

PUSH1 20   ; This is the code at address 17
POP         ; Pop the value (not used in this example)
```
### Detailed Steps

- **`PUSH1 01`**: Pushes `1` onto the stack (this is the condition for `JUMPI`).

  - **Stack**: `[1]`

- **`PUSH1 10`**: Pushes the address `16` (0x10) onto the stack (the destination for `JUMPI`).

  - **Stack**: `[16, 1]`

- **`JUMPI`**: Checks the condition at the top of the stack (`1`). Since `1` is true, it jumps to address `16`.

  - **Execution**: Jumps to address `16`.

- **Code Execution at Address 16**:

  - **`PUSH1 11`**: Pushes `17` onto the stack.
  
  - **`JUMP`**: Jumps to the next instruction at address `17`.

- **Code Execution at Address 17**:

  - **`PUSH1 20`**: Pushes `32` onto the stack.
  
  - **`POP`**: Removes the top value from the stack.

### Summary

- **`JUMP` Opcode**: Unconditionally jumps to a specified address in the code.
- **`JUMPI` Opcode**: Conditionally jumps to a specified address if a condition is met.
- **Usage**: Useful for creating loops and conditional execution in smart contracts.
