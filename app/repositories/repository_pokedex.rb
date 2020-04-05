class RepositoryPokedex
    
    class << self
        def register(params)
            Pokedex.create(params)
        end

        def get(params)
            if !params[:offset]
                pokedexes = Pokedex.limit(5).offset(0)
            else
                pokedexes = Pokedex.limit(5).offset(params[:offset])
            end
            pokedexes.each do |pokedex|
                types = PokedexType.where(:pokedex_id=>pokedex.id).all
                types.each do |type|
                    type.name = Type.where(:id=>type.type_id).select(:name).take.name
                end
                pokedex.pokedex_type = types
            end
            return pokedexes
        end

        def first_with_types(params)
            pokedex = Pokedex.find(params[:id])
            types = PokedexType.where(:pokedex_id=>pokedex.id).all
            types.each do |type|
                type.name = Type.where(:id=>type.type_id).select(:name).take.name
            end
            pokedex.pokedex_type = types
            return pokedex
        end

        def first(params)
            return Pokedex.find(params[:id])
        end

        def destroy(params)
            pokedex = Pokedex.find(params[:id])
            unless pokedex.destroy
                { response: pokedex.errors.full_messages, success: 0 } 
            else
                { response: {'message'=>'has been deleted'} , success: 1}
            end
        end
    end
end