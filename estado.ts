import { Persona } from "./Persona";

const persona = new Persona("julian", 20, "obcollazos@gmail.com");

console.log(persona.getName());

persona.setName("francisco");

console.log(persona.getName());

persona.setEmail("francisco@gmail");

console.log(persona.getEmail());
const numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

console.log(numeros.map((num) => num * 2));
