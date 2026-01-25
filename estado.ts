interface Pokemon {
  name: string;
  id: number;
  sprites: {
    front_default: string;
  };
}

export {};

const getPokemon = async (name: string): Promise<Pokemon | null> => {
  try {
    const response = await fetch(
      `https://pokeapi.co/api/v2/pokemon/${name.toLowerCase()}`,
    );
    if (!response.ok) return null;
    return await response.json();
  } catch {
    return null;
  }
};

const pokemon = await getPokemon("bulbasaur");

if (pokemon) {
  console.log(`Pokemon: ${pokemon.name} (#${pokemon.id})`);
  console.log(`Sprite: ${pokemon.sprites.front_default}`);
}

console.log("findata");
const nombre = "pepe";
console.log(nombre);
