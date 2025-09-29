class Persona {
  name: string;
  age: number;
  email: string;

  constructor(name: string, age: number, email: string) {
    this.name = name;
    this.age = age;
    this.email = email;
  }

  getName() {
    return this.name;
  }

  getAge() {
    return this.age;
  }

  setName(name: string) {
    this.name = name;
  }

  getEmail() {
    return this.email;
  }

  setEmail(email: string) {
    this.email = email;
  }
}

const persona = new Persona("julian", 20, "obcollazos@gmail.com");

console.log(persona.getName());

persona.setName("francisco");

console.log(persona.getName());

persona.setEmail("francisco@gmail");

console.log(persona.getEmail());
