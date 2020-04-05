class AuthLogin
    
    def self.call(*args, &block)
        new(*args, &block).login
    end

    def initialize(params)
        @params = params
    end
    
    def login
        user()
        if @user&.authenticate(@params[:password])
            token = JsonWebToken.encode(user_id: @user.id)
            time = Time.now + 24.hours.to_i
            playload = { token: token, exp: time.strftime("%m-%d-%Y %H:%M")}
            return playload
        else
            return nil
        end
    end

    private 

    def user
        @user = User.find_by_email(@params[:email])
    end

  end