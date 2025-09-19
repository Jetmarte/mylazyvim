class Persona {
  name: string;
  age: number;

  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }

  getName() {
    return this.name;
  }
  getAge() {
    return this.age;
  }
}

const p = new Persona("julian", 20);

console.log(p.getName());
console.log(p.getAge());
