require 'rails_helper'

RSpec.describe User, type: :model do

  it "é válido quando name, lastname, email,password e password_confirmation estão presentes" do 
    user = User.new( 
      name: 'teste', 
      lastname: 'last', 
      email: 'teste@teste.com',
      password: '123123',
      password_confirmation: '123123'
    )  
    expect(user).to be_valid 
  end

  it "é invalido sem o name" do 
    user = User.new(name: nil) 
    user.valid?   
    expect(user.errors[:name]).to include("can't be blank") 
  end 

  it "é invalido sem o lastname" do 
    user = User.new(lastname: nil) 
    user.valid?   
    expect(user.errors[:lastname]).to include("can't be blank") 
  end 

  it "é invalido sem o password" do 
    user = User.new(password: nil)
    user.valid?   
    expect(user.errors[:password]).to include("can't be blank") 
  end
  
  it "é invalido sem o password_confirmation" do 
    user = User.new(password_confirmation: nil)
    user.valid?   
    expect(user.errors[:password]).to include("can't be blank", "is too short (minimum is 6 characters)") 
  end

  it "é invalido com um password abaixo de 6 caracteres" do 
    user = User.new(password: '12312',password_confirmation: '12312')
    user.valid?   
    expect(user.errors[:password]).to include("is too short (minimum is 6 characters)") 
  end

  it "é invalido com um password não confere com password_confirmation" do 
    user = User.new(password: '123123',password_confirmation: '12312')
    user.valid?   
    expect(user.errors[:password]).to include() 
  end

  it "é invalido com um email invalido" do 
    user = User.new(email: 'teste.com')
    user.valid?   
    expect(user.errors[:email]).to include("is invalid") 
  end

  it "é inválido caso já exista um e-mail igual" do 
    User.create( 
        name: 'teste', 
        lastname: 'last', 
        email: 'teste@teste.com',
        password: '123123',
        password_confirmation: '123123'
    )
    user = User.new(email: 'teste@teste.com') 
    user.valid? 
    expect(user.errors[:email]).to include('has already been taken')
  end
 

end
