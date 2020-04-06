class UsersController < ApplicationController

    before_action :authorize_request, except: :create

    def index
        render json: @current_user, status: :ok
    end

    def show
        render json: @current_user, status: :ok
    end

    def create
        @user = User.new(user_params)
        if @user.save
            render json: {:message=>'success'}, status: :created
        else
            render json: { errors: @user.errors.full_messages },
                status: :unprocessable_entity
        end
    end

    def update
        unless @current_user.update(user_params)
            render json: { errors: @current_user.errors.full_messages },
                status: :unprocessable_entity
        else
            render json: @current_user, status: :ok
        end
    end

    private

    def user_params
        params.permit(
            :name, :lastname, :email, :password, :password_confirmation
        )
    end

end
