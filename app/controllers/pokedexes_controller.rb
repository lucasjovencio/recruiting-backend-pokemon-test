class PokedexesController < ApplicationController
    before_action :authorize_request
    
    def index
        pokedexes = RepositoryPokedex.get(pokedex_params)
        render json: pokedexes, status: :ok
    end

    def show
        pokedex = RepositoryPokedex.first_with_types(pokedex_params)
        render json: pokedex, status: :ok
    end

    def destroy
        pokedex = RepositoryPokedex.destroy(pokedex_params)
        if pokedex[:success]
            render json: pokedex[:response], status: :ok
        else
            render json: pokedex[:response], status: :unprocessable_entity
        end
    end

    def update
        pokedex = PokedexUpdate.call(pokedex_params)
        if pokedex[:success]
            render json: pokedex[:response], status: :ok
        else
            render json: pokedex[:response], status: :unprocessable_entity
        end
    end

    def pokedex_params
        params.permit(
            :offset,
            :id,
            :name_english,
            :name_japanese,
            :name_chinese,
            :name_french,
            :hp,
            :attack,
            :defense,
            :speed_attack,
            :speed_defense,
            :speed,
            :speed_attack,
            :speed_attack,
        )
    end

end
