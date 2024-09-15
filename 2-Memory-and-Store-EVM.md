### MEMORY AND STORE (EVM)
In the EVM (Ethereum Virtual Machine), **memory** and **storage** are two places where smart contracts store and handle data, but they work differently:

### 1. **Memory**
- **Temporary and Volatile**: Memory is temporary and only lasts during the execution of a transaction. Once the transaction finishes, the memory is cleared.
- **Fast**: Using memory is faster and cheaper in terms of gas, but it doesn’t persist after the execution ends.
- **Typical Use**: It’s used when you need to handle temporary data or perform calculations that don’t need to be stored after the contract finishes execution.

### 2. **Storage**
- **Permanent and Persistent**:: Storage is permanent and lasts forever (or until you modify it). Data in storage remains available between different transactions.
- **Slower and More Expensive**: Saving and reading data from storage costs more gas because it’s slower, but what you store there persists.
- **Typical Use**: It’s used to store important long-term data, like account balances, settings, or critical information that the contract needs to remember.

### Easy Example
- **Memory**: Think of memory like a scrap of paper you use to do quick calculations. Once you're done, you throw it away.
- **Storage**: Storage is like a notebook you keep forever. If you write something in it, you can always go back and check what you wrote.

> ✨📝 In summary,<br> **memory** is temporary and fast, while **storage** is permanent and more costly, but it retains data between contract executions.