# Explanation of the **SHR** Opcode (Right Shift) in the EVM

The **SHR** opcode in the **Ethereum Virtual Machine (EVM)** is used to perform a logical right shift operation. Simply put, it moves **bits** to the right by a specified number of positions.

## How Does It Work?

- **SHR** takes two inputs from the stack:
  - **shift**: the number of positions (**bits**) to move to the right.
  - **value**: the value (32 bytes) to be shifted.

- After applying the shift, the bits that "fall off" the value are discarded, and zeros are filled in the most significant positions (the leftmost bits).

## Real-Life Example

Imagine you have a row of boxes with balls inside. Each ball represents a **bit** of information (1 or 0).

- **SHR** is like moving all the balls to the right by a certain number of positions. The balls that fall off the right are lost, and the empty boxes on the left are filled with new balls (which are always zeros).

## Example in the EVM

Suppose you have the following value on the stack:

```solidity
0xF0
```
We can write our hex (**0xF0**) in binary to see its bits representation. We can use the `command cast --to-base 0xF0 bin` in Foundry to get the binary output:

```bash
cast --to-base 0xF0 bin
0b11110000
```
If you apply **SHR** with a shift of 2 positions:

```text
SHR 0x02
```
The value in binary would shift to the right and be filled with zeros in the leftmost positions:

```text
0b00111100
```
We can use the command `cast --to-base 00111100 hex` to see the representation of **00111100** in hex:

```bash
cast --to-base 0b00111100 hex
0x3c
```
This is equivalent to dividing the original value by 4.

#### Additional Notes
**SHR** is an unsigned operation. That is, it does not consider whether the number is positive or negative, it just shifts the bits. If the shift is greater than **255**, the result is always 0.

### Example: Extracting the Function Selector from Calldata
To extract the function selector from the following calldata:

```solidity
0xe026c0170000000000000000000000000000000000000000000000000000000000000001
```
The calldata contains the function selector in the first 4 bytes. The selector is **0xe026c017**.

```bash
cast --to-base 0xe026c017 bin
0b11100000001001101100000000010111 //32 bits 
```
#### How Do We Extract It?
Data in the calldata:

- The complete calldata is:

```solidity
0xe026c017 0000000000000000000000000000000000000000000000000000000000000001
```
- Process to extract the selector:

* Use **SHR** to remove all the bits to the right of the first 4 bytes.
* Since there are 32 bytes in total, and we want to remove 28 bytes (224 bits), we use:

```solidity
SHR 224  // Shift 224 bits to the right
```
- Result:
Shifting the calldata 224 bits to the right, the remaining value is:

```solidity
0xe026c017
```
This is the function selector.

### Summary:
**SHR** moves the bits to the right and fills with zeros on the left. Using **SHR**, you can extract specific data from calldata, such as the function selector (the first 4 bytes).