require 'json'
class PokedexUpdate
    

    def self.call(*args, &block)
        new(*args, &block).update
    end

    def initialize(params)
        @params = params
        @response = {}
        @pokedex = RepositoryPokedex.first(params)
    end
    
    def update
        update_nome_english()
        update_nome_japanese()
        update_nome_chinese()
        update_nome_french()
        update_status_battle()
        return @response
    end
    
    private 

    def update_status_battle()
        unless @pokedex.update(status_params)
            @response = { response: @pokedex.errors.full_messages, success: 0 } 
        else
            @response = { response: @pokedex , success: 1}
        end
    end

    def update_nome_english
        if (@params[:name_english] != '' && @params[:name_english] != nil)
            @nome = @pokedex.name
            @nome['english'] = @params[:name_english]
            update_name()
        end
    end

    def update_nome_japanese
        if (@params[:name_japanese] != '' && @params[:name_japanese] != nil)
            @nome = @pokedex.name
            @nome['japanese'] = @params[:name_japanese]
            update_name()
        end
    end

    def update_nome_chinese
        if (@params[:name_chinese] != '' && @params[:name_chinese] != nil)
            @nome = @pokedex.name
            @nome['chinese'] = @params[:name_chinese]
            update_name()
        end
    end

    def update_nome_french
        if (@params[:name_french] != '' && @params[:name_french] != nil)
            @nome = @pokedex.name
            @nome['french'] = @params[:name_french]
            update_name()
        end
    end

    def update_name
        unless @pokedex.update({:name => @nome})
            @response = { response: @pokedex.errors.full_messages, success: 0 } 
        else
            @response = { response: @pokedex , success: 1}
        end
    end
    
    def status_params
        @params.permit(
            :hp, :attack, :defense, :speed, :speed_attack, :speed_defense
        )
    end
    
  end