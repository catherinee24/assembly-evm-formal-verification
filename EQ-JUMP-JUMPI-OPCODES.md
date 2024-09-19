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
