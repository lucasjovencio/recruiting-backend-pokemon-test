require 'json'
class AuthenticationController < ApplicationController
    before_action :authorize_request, except: :login

    def login
        response = AuthLogin.call(params)
        if response
            render json: response, status: :ok
        else
            render json: { error: 'unauthorized' }, status: :unauthorized
        end
    end

    private
    
    def login_params
        params.permit(:email, :password)
    end
end
