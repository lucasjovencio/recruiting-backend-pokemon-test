class RepositoryPokedexType
    
    class << self
        def register(params)
            PokedexType.create(params)
        end

        def first_or_create(params)
            PokedexType.where(:pokedex_id=>params[:pokedex_id],:type_id=>params[:type_id]).first_or_create()
        end
    end
end