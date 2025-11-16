export class Persona {
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

  /**
   * Retorna el email de una Persona
   * @returns {string} email
   */
  getEmail(): string {
    return this.email;
  }

  setEmail(email: string) {
    this.email = email;
  }
}
