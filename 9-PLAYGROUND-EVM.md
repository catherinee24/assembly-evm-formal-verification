## Explicación del Calldata y Opcodes

### Calldata: `60058060093d393df35f3560e01c`
- Contract Creation -> **60058060093d393df3**5f3560e01c 

### Paso a paso de los Opcodes y el Stack

#### [00] PUSH1 05 (6005) 
**6005**8060093d393df35f3560e01c
**Instrucción:** Empuja el valor `05` en la parte superior del stack.  
**¿Por qué `05`?** Este valor representa la posición en la **memoria** donde se copiarán los datos. Es el destino en la memoria para empezar a escribir.  
**Stack:** `[05]`

#### [02] DUP1 (80)
6005**80**60093d393df35f3560e01c
**Instrucción:** Duplica el valor en la parte superior del stack.  
**¿Por qué duplicar?** Duplica `05` porque más adelante se necesita tanto el destino en la memoria como el tamaño de los datos para la operación `CODECOPY`.  
**Stack:** `[05, 05]`

#### [03] PUSH1 09 (6009)
600580**6009**3d393df35f3560e01c
**Instrucción:** Empuja el valor `09` en la parte superior del stack.  
**¿Por qué `09`?** Este valor representa el tamaño en bytes que se copiarán desde el código. Especifica cuántos bytes se deben copiar en la memoria.  
**Stack:** `[09, 05, 05]`

#### [05] RETURNDATASIZE (3d)
6005806009**3d**393df35f3560e01c
**Instrucción:** Empuja el tamaño de los datos devueltos al stack (que, si no hay datos devueltos todavía, es 0).  
**¿Por qué usar `RETURNDATASIZE`?** Necesitamos saber el tamaño de los datos devueltos para poder realizar operaciones en base a ese tamaño.  
**Stack:** `[0, 09, 05, 05]`

#### [06] CODECOPY (39)
60058060093d**39**3df35f3560e01c
- La instrucción **CODECOPY** tiene tres parámetros que necesita del stack:

1. **Memoria de destino (destOffset)**: Especifica dónde en la memoria se copiará el código.
2. **Posición de origen en el código (offset)**: Especifica desde dónde en el contrato (en bytecode) se comenzará a copiar.
3. **Tamaño (size)**: La cantidad de bytes a copiar.
**Instrucción:** Copia `05` bytes de código desde la posición `09` en el código hacia la memoria en la posición `05`.  
**¿Qué hace?** Copia una parte del código del contrato a la memoria en la ubicación especificada.  
**Stack:** `[05, 05]` (El stack no cambia aquí)

#### [07] RETURNDATASIZE (3d)
60058060093d39**3d**f35f3560e01c
**Instrucción:** Coloca nuevamente el tamaño de los datos devueltos en la parte superior del stack (todavía es 0).  
**¿Por qué repetir `RETURNDATASIZE`?** Confirmamos que no hay datos devueltos antes de continuar.  
**Stack:** `[0, 05, 05]`

#### [08] RETURN (f3)
60058060093d393d**f3**5f3560e01c
**Instrucción:** Devuelve los datos copiados en la memoria y termina la ejecución.  
**¿Qué hace?** Termina la ejecución del contrato y devuelve los datos que se copiaron en la memoria.  
**Stack:** El valor devuelto depende de los datos copiados anteriormente.

#### [09] PUSH0

**Instrucción:** Empuja el valor `0` al stack.  
**¿Por qué `0`?** El valor `0` se utiliza como una referencia o inicialización para operaciones posteriores.  
**Stack:** `[0, 0]`

#### [0A] CALLDATALOAD
**Instrucción:** Carga datos del calldata en la posición `0`. Esto toma los `32` bytes de datos a partir de la posición `0` del calldata.  
**¿Qué hace?** Lee los datos de la transacción en la posición indicada del calldata.  
**Stack:** `[calldata[0], 0]`

#### [0B] PUSH1 e0
**Instrucción:** Empuja el valor `e0` al stack.  
**¿Por qué `e0`?** El valor `e0` es el número de bits para desplazar en la operación `SHR`. Representa el número de bits que se desplazarán a la derecha.  
**Stack:** `[0xe0, calldata[0], 0]`

#### [0D] SHR
**Instrucción:** Desplaza el valor superior del stack (`calldata[0]`) a la derecha `e0` bits. Básicamente, esto elimina los bits más significativos.  
**¿Qué hace?** Mueve los bits de `calldata[0]` hacia la derecha y elimina los bits más significativos, rellenando con ceros a la izquierda.  
**Stack:** `[calldata[0] >> 0xe0, 0]`

---

## Explanation of Calldata and Opcodes

### Calldata: `60058060093d393df35f3560e01c`

### Step-by-Step of the Opcodes and Stack

#### [00] PUSH1 05
**Instruction:** Pushes the value `05` onto the top of the stack.  
**Why `05`?** This value represents the **memory** position where the data will be copied. It's the destination in memory to start writing.  
**Stack:** `[05]`

#### [02] DUP1
**Instruction:** Duplicates the value at the top of the stack.  
**Why duplicate?** Duplicates `05` because later both the memory destination and data size will be needed for the `CODECOPY` operation.  
**Stack:** `[05, 05]`

#### [03] PUSH1 09
**Instruction:** Pushes the value `09` onto the top of the stack.  
**Why `09`?** This value represents the size in bytes of code to be copied from the code. Specifies how many bytes to copy into memory.  
**Stack:** `[09, 05, 05]`

#### [05] RETURNDATASIZE
**Instruction:** Pushes the size of the returned data onto the stack (which, if no data has been returned yet, is 0).  
**Why use `RETURNDATASIZE`?** We need to know the size of returned data to perform operations based on that size.  
**Stack:** `[0, 09, 05, 05]`

#### [06] CODECOPY
**Instruction:** Copies `05` bytes of code from position `09` in the code to memory at position `05`.  
**What does it do?** Copies a portion of the contract's code to memory at the specified location.  
**Stack:** `[05, 05]` (Stack does not change here)

#### [07] RETURNDATASIZE
**Instruction:** Places the size of the returned data back onto the top of the stack (still 0).  
**Why repeat `RETURNDATASIZE`?** Confirm that no data has been returned before proceeding.  
**Stack:** `[0, 05, 05]`

#### [08] RETURN
**Instruction:** Returns the data copied in memory and ends execution.  
**What does it do?** Ends contract execution and returns the data that was copied to memory.  
**Stack:** The returned value depends on the data copied earlier.

#### [09] PUSH0
**Instruction:** Pushes the value `0` onto the stack.  
**Why `0`?** The value `0` is used as a reference or initialization for later operations.  
**Stack:** `[0, 0]`

#### [0A] CALLDATALOAD
**Instruction:** Loads data from calldata at position `0`. This takes the `32` bytes of data from position `0` of the calldata.  
**What does it do?** Reads the transaction data from the indicated position in the calldata.  
**Stack:** `[calldata[0], 0]`

#### [0B] PUSH1 e0
**Instruction:** Pushes the value `e0` onto the stack.  
**Why `e0`?** The value `e0` is the number of bits for shifting in the `SHR` operation. Represents the number of bits to shift to the right.  
**Stack:** `[0xe0, calldata[0], 0]`

#### [0D] SHR
**Instruction:** Shifts the top value of the stack (`calldata[0]`) right by `e0` bits. This effectively removes the most significant bits.  
**What does it do?** Moves the bits of `calldata[0]` to the right and removes the most significant bits, filling with zeros on the left.  
**Stack:** `[calldata[0] >> 0xe0, 0]`
