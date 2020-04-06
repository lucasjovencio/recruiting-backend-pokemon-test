require 'json'
class PokedexCreate
    def self.call(*args, &block)
        new(*args, &block).create
    end

    def initialize(params)
        @params = params
        @response = {}
    end
    
    def create
        insert_status_battle()
        insert_names()
        save()
        types()
        return @response
    end
    
    private 

    def insert_status_battle()
        @pokedex = Pokedex.new(status_params)
    end

    def insert_names
        if( (@params[:name] == '' || @params[:name] == nil) || JsonWebToken.valid?(@params[:name]) == false)
            return
        end
        names = JSON.parse(@params[:name])
        @pokedex.name = names
    end

    def save()
        if @pokedex.save
            @response = { response: @pokedex , success: 1}
        else
            @response = { response: @pokedex.errors.full_messages, success: 0 } 
        end
    end

    def status_params
        @params.permit(
            :hp, :attack, :defense, :speed, :speed_attack, :speed_defense
        )
    end

    def types
        types = JSON.parse(@params[:types])
        types.each do |key|
            RepositoryPokedexType.register([
                pokedex_id: @pokedex.id,
                type_id: key
            ])
        end
        types = PokedexType.where(:pokedex_id=>@pokedex.id).all
        types.each do |type|
            type.name = Type.where(:id=>type.type_id).select(:name).take.name
        end
        @pokedex.pokedex_type = types
    end
end