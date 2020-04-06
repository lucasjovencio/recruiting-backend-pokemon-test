require 'rails_helper'

RSpec.describe Pokedex, type: :model do
  json = JSON.parse('{"english": "name","chinese": "","japanese": ""}')

  it "é válido quando name, hp, attack, defense, speed_attack, speed_defense e speed estão presentes " do 
    pokedex = Pokedex.new( 
      name: json,
      hp: '50',
      attack: '60',
      defense: '100',
      speed: '85',
      speed_attack: '50',
      speed_defense: '50',
    )  
    expect(pokedex).to be_valid 
  end

  it "é inválido sem um objeto json em name" do 
    pokedex = Pokedex.new( 
      name: ''
    )  
    pokedex.validate  
    expect(pokedex.errors[:name]).to include("can't be blank") 
  end

  it "é inválido sem um objeto json em name" do 
    pokedex = Pokedex.new( 
      name: nil
    )  
    pokedex.validate  
    expect(pokedex.errors[:name]).to include("can't be blank") 
  end

  json2 = JSON.parse('{}')
  it "é inválido quando um objeto json vazio" do 
    pokedex = Pokedex.new( 
      name: json2
    )  
    pokedex.validate  
    expect(pokedex.errors[:name]).to include("can't be blank") 
  end

  json3 = JSON.parse('{"english": "","chinese": "","japanese": ""}')
  it "é inválido quando um objeto json de nomes não contem nenhum nome" do 
    pokedex = Pokedex.new( 
      name: json3
    )  
    pokedex.valid?
    expect(pokedex.errors[:name]).to include("can't be blank") 
  end

  it "é invalido sem o hp" do 
    pokedex = Pokedex.new(hp: nil) 
    pokedex.valid?
    expect(pokedex.errors[:hp]).to include("can't be blank") 
  end 

  it "é invalido sem o attack" do 
    pokedex = Pokedex.new(attack: nil) 
    pokedex.valid?
    expect(pokedex.errors[:attack]).to include("can't be blank") 
  end 

  it "é invalido sem o defense" do 
    pokedex = Pokedex.new(defense: nil) 
    pokedex.valid?
    expect(pokedex.errors[:defense]).to include("can't be blank") 
  end 

  it "é invalido sem o speed" do 
    pokedex = Pokedex.new(speed: nil) 
    pokedex.valid?
    expect(pokedex.errors[:speed]).to include("can't be blank") 
  end 

  it "é invalido sem o speed_defense" do 
    pokedex = Pokedex.new(speed_defense: nil) 
    pokedex.valid?
    expect(pokedex.errors[:speed_defense]).to include("can't be blank") 
  end 

  it "é invalido sem o speed_attack" do 
    pokedex = Pokedex.new(speed_attack: nil) 
    pokedex.valid?
    expect(pokedex.errors[:speed_attack]).to include("can't be blank") 
  end 
  
end
