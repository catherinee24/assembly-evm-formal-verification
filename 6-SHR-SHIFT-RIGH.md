# Explicación del Opcode **SHR** (Right Shift) en la EVM

El opcode **SHR** en la **Ethereum Virtual Machine (EVM)** se usa para realizar una operación de desplazamiento lógico hacia la derecha. En términos simples, mueve los bits hacia la derecha un número específico de posiciones.

---

## ¿Cómo funciona?

- **SHR** toma dos entradas del stack:
  - **shift**: la cantidad de posiciones (bits) que se moverán hacia la derecha.
  - **value**: el valor (32 bytes) que será desplazado.

- Después de aplicar el desplazamiento, los bits que "caen" fuera del valor se eliminan, y se rellenan con ceros en las posiciones más significativas (los bits de la izquierda).

---

## Ejemplo de la vida real

Imagina que tienes una fila de cajas con pelotas dentro. Cada pelota representa un **bit** de información (1 o 0).

- **SHR** es como mover todas las pelotas hacia la derecha un número de posiciones. Las pelotas que salen por la derecha se pierden, y las cajas vacías de la izquierda se llenan con pelotas nuevas (que siempre son ceros).

---

## Ejemplo en la EVM

Supongamos que tienes el siguiente valor en el stack:

```solidity
0xF0   
```
We can write our hex (0xF0) in binary to see its **bits** representation, we can use the command `cast --to-base 0xF0 bin` in foundry to have the binary output for us. **0xF0 = 11110000 en binario**
```bash
cast --to-base 0xF0 bin
0b11110000
```
Si aplicas **SHR** con un desplazamiento de 2 posiciones:

```text
SHR 0x02
```
El valor en binario se desplazaría hacia la derecha y se rellenaría con ceros en las posiciones de la izquierda:

```text
0b00111100 en binario
```
Podemos usar el comando de `cast --to-base 00111100 hex` para ver la representacion de **00111100** en Hex
```bash
cast --to-base 0b00111100 hex
0x3c
```
Esto es equivalente a dividir el valor original entre 4.

### Notas adicionales
**SHR** es una operación no firmada (sin signo). Es decir, no tiene en cuenta si el número es positivo o negativo, simplemente desplaza los bits.
Si el desplazamiento es mayor a 255, el resultado es siempre 0.

---

#### Ejemplo: Obtener el selector de función del calldata
Para obtener el selector de función del siguiente calldata:

```solidity
0xe026c0170000000000000000000000000000000000000000000000000000000000000001
```
El calldata contiene el selector de función en los primeros **4 bytes**. El selector es **0xe026c017**.

#### ¿Cómo lo extraemos?

- Datos en el calldata:

- El calldata completo es:
```solidity
0xe026c017 0000000000000000000000000000000000000000000000000000000000000001
```
- Proceso para extraer el selector:

* Usamos **SHR** para eliminar todos los bits a la derecha de los primeros 4 bytes.
* Como hay 32 bytes en total, y queremos eliminar 28 bytes (224 bits), usamos:
```solidity
SHR 224  // Desplaza 224 bits hacia la derecha
```
- Resultado:

Al desplazar el calldata 224 bits hacia la derecha, el valor restante es:
```solidity 
0xe026c017
```
Este es el selector de función.

#### Resumen:
**SHR** mueve los bits a la derecha y rellena con ceros a la izquierda.
Usando **SHR** puedes extraer datos específicos de calldata, como el selector de función (los primeros 4 bytes).