require 'json'

class PokedexSeedCreator

    def self.call(*args, &block)
        new(*args, &block).create
    end

    def initialize(pokedex)
        @pokedex = pokedex
    end
    
    def create
        @poke = RepositoryPokedex.register(
            {
                name: @pokedex['name'],
                hp: @pokedex['base']['HP'],
                attack: @pokedex['base']['Attack'],
                defense: @pokedex['base']['Defense'],
                speed_attack: @pokedex['base']['Sp. Attack'],
                speed_defense: @pokedex['base']['Sp. Defense'],
                speed: @pokedex['base']['Speed']
            }
        )
        images()
        types()
    end

    private 
    
    def images
        # if @poke
        #     if @pokedex['id'] < 10
        #         @poke.image.attach(io: File.open(Rails.root.join('db', 'assets/images/')), filename: "00#{@pokedex['id']}.png")
        #         @poke.sprite.attach(io: File.open(Rails.root.join('db', 'assets/sprites/')), filename: "00#{@pokedex['id']}.png")
        #         @poke.thumbnail.attach(io: File.open(Rails.root.join('db', 'assets/thumbnails/')), filename: "00#{@pokedex['id']}.png")
        #     elsif @pokedex['id'] < 100
        #         @poke.image.attach(io: File.open(Rails.root.join('db', 'assets/images/')), filename: "0#{@pokedex['id']}.png")
        #         @poke.sprite.attach(io: File.open(Rails.root.join('db', 'assets/sprites/')), filename: "0#{@pokedex['id']}.png")
        #         @poke.thumbnail.attach(io: File.open(Rails.root.join('db', 'assets/thumbnails/')), filename: "#{@pokedex['id']}.png")
        #     else
        #         @poke.image.attach(io: File.open(Rails.root.join('db', 'assets/images/')), filename: "#{@pokedex['id']}.png")
        #         @poke.sprite.attach(io: File.open(Rails.root.join('db', 'assets/sprites/')), filename: "#{@pokedex['id']}.png")
        #         @poke.thumbnail.attach(io: File.open(Rails.root.join('db', 'assets/thumbnails/')), filename: "#{@pokedex['id']}.png")
        #     end
        # end
    end

    def types
        @pokedex['type'].each do |name|
            type = RepositoryType.find_by_name_english(name)
            if type
                RepositoryPokedexType.register([
                    pokedex_id: @poke.id,
                    type_id: type.id
                ])
            else
                type = RepositoryType.register({name: {
                    "english": "#{name}",
                    "chinese": "",
                    "japanese": ""
                  }
                })
                RepositoryPokedexType.register([
                    pokedex_id: @poke.id,
                    type_id: type.id
                ])
            end
        end
    end
    

  end