// Imprime "hola mundo" en la consola
console.log("hola mundo");

class Persona {
  private _nombre: string;
  private _id: number;
  private _cargo: string;

  constructor(nombre: string, id: number, cargo: string) {
    this._nombre = nombre;
    this._id = id;
    this._cargo = cargo;
    console.log("hola")
  }

  get nombre(): string {
    return this._nombre;
  }

  set nombre(nombre: string) {
    this._nombre = nombre;
  }

  get id(): number {
    return this._id;
  }

  set id(id: number) {
    this._id = id;
  }

  get cargo(): string {
    return this._cargo;
  }

  set cargo(cargo: string) {
    this._cargo = cargo;
  }
}
