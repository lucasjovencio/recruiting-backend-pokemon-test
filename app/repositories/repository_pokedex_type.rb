class RepositoryPokedexType
    
    class << self
        def register(params)
            PokedexType.create(params)
        end
    end
end