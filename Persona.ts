export class Persona {
  constructor(
    public name: string,
    public age: number,
    private _email: string,
  ) {}

  get email(): string {
    return this._email;
  }

  set email(value: string) {
    if (!value.includes("@")) {
      throw new Error("Email inválido");
    }
    this._email = value;
  }

  greet(): string {
    return `Hola, soy ${this.name} y tengo ${this.age} años`;
  }
}
