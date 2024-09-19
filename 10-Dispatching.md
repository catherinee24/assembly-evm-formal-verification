## What is Function Dispatching?

### Function Call
When a smart contract receives a call, the EVM needs to know which specific function to execute. This is done through a process called "function dispatching."

### Function Selector
Each function in a contract has a unique identifier called a function selector. This selector is generated from the first 4 bytes of the SHA-3 (Keccak-256) hash of the function's name and its argument types. For example, if you have a function called `transfer(address,uint256)`, its selector will be something like `0xa9059cbb`.

### Calldata
When a transaction is sent to a contract, the call data (called calldata) includes this selector. The first 4 bytes of the data are the selector that tells the EVM which function to execute.

### Dispatching
The EVM uses this selector to look up the correct function within the contract. Once it finds the function, it executes it and passes any additional arguments that are also included in the calldata.

### Simple Example
Imagine you have a contract with the following functions:

- `transfer(address recipient, uint256 amount)`
- `approve(address spender, uint256 amount)`

When you call `transfer`, the transaction data will include the selector for `transfer`. The EVM looks at this selector and knows that it needs to execute the `transfer` function, passing the necessary arguments.

### Summary
- Function dispatching is how the EVM decides which function to execute in a smart contract.
- It uses a function selector (the first 4 bytes of the function hash) found in the call data.
- Once identified, the EVM executes the corresponding function with its arguments.
- This process is fundamental for smart contracts to interact efficiently and accurately.

---

## Let's make a really easy example of this 😊

Imagine you are at a restaurant and want to place an order. In this case, the process of placing an order is similar to how function dispatching works in a smart contract.

### Restaurant Menu
The menu is like the smart contract, where all the functions (or dishes) you can order are defined. Each dish has a name and sometimes various ingredients.

### Ordering a Dish
When you decide you want a "cheeseburger," you tell the waiter that you want to place an order. Your order is like the calldata, where you specify what you want.

### Dish Selector
The restaurant has a list of codes for each dish. For example, "cheeseburger" might have the code "001." This code is similar to the function selector in the EVM.

### Dispatcher (Waiter)
The waiter takes your order (calldata) and looks at the code (selector). He knows that he needs to go to the kitchen and order a "cheeseburger" (execute the corresponding function).

### Receiving Your Order
Finally, the waiter returns with your cheeseburger. This is the result of the function execution in the smart contract.

### Summary of the Example
- Menu = Smart Contract
- Dishes = Contract Functions
- Dish Code = Function Selector
- Waiter = EVM Dispatching the Function
- Order = Call Data (Calldata)

So, function dispatching in the EVM works similarly to how you place an order at a restaurant, ensuring you get exactly what you requested.

---

## ¿Qué es el Dispatching de Funciones?

### Llamada a Funciones
Cuando un contrato inteligente recibe una llamada, la EVM necesita saber qué función específica debe ejecutar. Esto se hace a través de un proceso llamado "dispatching de funciones".

### Selector de Función
Cada función en un contrato tiene un identificador único llamado selector de función. Este selector se genera a partir de los primeros 4 bytes del hash SHA-3 (Keccak-256) del nombre de la función y sus tipos de argumentos. Por ejemplo, si tienes una función llamada `transfer(address,uint256)`, su selector será algo como `0xa9059cbb`.

### Calldata
Cuando se envía una transacción a un contrato, los datos de la llamada (llamados calldata) incluyen este selector. Los primeros 4 bytes de los datos son el selector que le dice a la EVM qué función ejecutar.

### Dispatching
La EVM utiliza este selector para buscar la función correcta dentro del contrato. Una vez que encuentra la función, la ejecuta y pasa cualquier argumento adicional que también está incluido en el calldata.

### Ejemplo Sencillo
Imagina que tienes un contrato con las siguientes funciones:

- `transfer(address recipient, uint256 amount)`
- `approve(address spender, uint256 amount)`

Cuando haces una llamada a `transfer`, los datos de la transacción incluirán el selector para `transfer`. La EVM mira este selector y sabe que debe ejecutar la función `transfer`, pasándole los argumentos necesarios.

### Resumen
- El dispatching de funciones es cómo la EVM decide qué función ejecutar en un contrato inteligente.
- Utiliza un selector de función (los primeros 4 bytes del hash de la función) que se encuentra en los datos de la llamada.
- Una vez identificado, la EVM ejecuta la función correspondiente con sus argumentos.
- Este proceso es fundamental para que los contratos inteligentes puedan interactuar de manera eficiente y precisa.
---
## Ejemplo de la Vida Real

Imagina que estás en un restaurante y quieres hacer un pedido. En este caso, el proceso de hacer un pedido es similar a cómo funciona el dispatching de funciones en un contrato inteligente.

### Menú del Restaurante
El menú es como el contrato inteligente, donde están definidas todas las funciones (o platos) que puedes pedir. Cada plato tiene un nombre y a veces varios ingredientes.

### Ordenar un Plato
Cuando decides que quieres una "hamburguesa con queso", le dices al camarero que quieres hacer un pedido. Tu pedido es como el calldata, donde le indicas qué quieres.

### Selector de Plato
El restaurante tiene una lista de códigos para cada plato. Por ejemplo, "hamburguesa con queso" puede tener el código "001". Este código es similar al function selector en la EVM.

### Dispatcher (Camarero)
El camarero toma tu pedido (calldata) y mira el código (selector). Sabe que tiene que ir a la cocina y pedir "hamburguesa con queso" (ejecutar la función correspondiente).

### Recibir tu Pedido
Finalmente, el camarero regresa con tu hamburguesa. Este es el resultado de la ejecución de la función en el contrato inteligente.

### Resumen del Ejemplo
- Menú = Contrato Inteligente
- Platos = Funciones del Contrato
- Código del Plato = Function Selector
- Camarero = EVM que Despacha la Función
- Pedido = Datos de la Llamada (Calldata)

Así, el dispatching de funciones en la EVM funciona de manera similar a cómo haces un pedido en un restaurante, asegurándose de que recibas exactamente lo que has solicitado.
