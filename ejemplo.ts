function suma(a: number, b: number): number {
  return a + b;
}

console.log(suma(1, 2));
console.assert(suma(1, 2) === 6);

function resta(a: number, b: number): number {
  return a - b;
}

for (let i = 0; i < 10; i++) {
  console.log(resta(10, i));
}
