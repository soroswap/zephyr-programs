

// const fs = require('fs');

// // Leer el archivo pairs.json
// fs.readFile('/workspace/pairs-testnet.json', 'utf8', (err, data) => {
//   if (err) {
//     console.error('Error al leer el archivo:', err);
//     return;
//   }

//   try {
//     const pairs = JSON.parse(data);

//     // Crear un objeto para almacenar los pares únicos y sus índices
//     const seenPairs = new Map();
//     const repeatedPairs = [];

//     // Recorrer el array de pares para verificar duplicados
//     pairs.forEach(({ tokenA, tokenB, address }, index) => {
//       const pair = `${tokenA}-${tokenB}`;
//       if (seenPairs.has(pair)) {
//         console.log("got pair ", tokenA, tokenB, address)
//         repeatedPairs.push({
//           pair: pair,
//           firstIndex: seenPairs.get(pair),
//           repeatedIndex: index
//         });
//       } else {
//         seenPairs.set(pair, index);
//       }
//     });

//     if (repeatedPairs.length > 0) {
//       console.log("Pares repetidos encontrados:");
//       repeatedPairs.forEach(({ pair, firstIndex, repeatedIndex }) => {
//         console.log(`Par: ${pair} | Primera aparición: ${firstIndex} | Repetido en: ${repeatedIndex}`);
//       });
//     } else {
//       console.log("No hay pares repetidos");
//     }
//   } catch (parseError) {
//     console.error('Error al analizar el archivo JSON:', parseError);
//   }
// });
