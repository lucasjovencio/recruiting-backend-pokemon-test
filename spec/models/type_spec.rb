require 'rails_helper'
require 'json'
RSpec.describe Type, type: :model do
  
  json = JSON.parse('{"english": "name","chinese": "","japanese": ""}')
  it "é válido quando recebe um json de nomes com pelo menos 1(um) nome preenchido" do 
    type = Type.new( 
      name: json
    )  
    expect(type).to be_valid 
  end

  it "é inválido sem um objeto json" do 
    type = Type.new( 
      name: ''
    )  
    type.valid?   
    expect(type.errors[:name]).to include("can't be blank") 
  end

  it "é inválido sem um objeto json" do 
    type = Type.new( 
      name: nil
    )  
    type.valid?   
    expect(type.errors[:name]).to include("can't be blank") 
  end

  json2 = JSON.parse('{}')
  it "é inválido quando um objeto json vazio" do 
    type = Type.new( 
      name: json2
    )  
    type.valid?   
    expect(type.errors[:name]).to include("can't be blank") 
  end

  json3 = JSON.parse('{"english": "","chinese": "","japanese": ""}')
  it "é inválido quando um objeto json de nomes não contem nenhum nome" do 
    type = Type.new( 
      name: json3
    )  
    type.valid?   
    expect(type.errors[:name]).to include("can't be blank") 
  end
  
end
