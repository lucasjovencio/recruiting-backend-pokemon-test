# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'

ActiveRecord::Base.transaction do
    # Migração dos tipos
    file = File.read(Rails.root.join('db', 'assets/','types.json'))
    types = JSON.parse(file)
    types.each { |type|  RepositoryType.register({name:type}) }
    
    # Migração dos pokedexs
    file = File.read(Rails.root.join('db', 'assets/','pokedex.json'))
    pokedexs = JSON.parse(file)
    pokedexs.each do |pokedex| 
        PokedexSeedCreator.call(pokedex)
    end 
end