class Persona {
  private name: string;
  private age: number;

  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }

  getName(): string {
    return this.name;
  }

  setName(name: string): void {
    this.name = name;
  }
}

const p = new Persona("John", 30);

console.log(p.getName());

p.setName("macario");
console.log(p.getName());
