require 'rails_helper'

RSpec.describe PokedexType, type: :model do

  json = JSON.parse('{"english": "name","chinese": "","japanese": ""}')
  pokedex = Pokedex.create( 
    name: json,
    hp: 50,
    attack: 60,
    defense: 100,
    speed: 85,
    speed_attack: 50,
    speed_defense: 50,
  )  
  type = Type.create(name:json)  
  it "é válido quando recebe type_id e pokedex_id" do 
    pokedexType = PokedexType.new( 
      type_id: type.id,
      pokedex_id: pokedex.id
    )  
    expect(pokedexType).to be_valid 
  end

  it "é inválido sem o identificador de pokedex" do 
    pokedexType = PokedexType.new( 
      pokedex_id: nil
    )  
    pokedexType.valid?   
    expect(pokedexType.errors[:pokedex_id]).to include("can't be blank") 
  end

  it "é inválido sem o identificador de type" do 
    pokedexType = PokedexType.new( 
      type_id: nil
    )  
    pokedexType.valid?   
    expect(pokedexType.errors[:type_id]).to include("can't be blank") 
  end

end
