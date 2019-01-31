class UsersController < ApplicationController
    def new
        render :new
    end

    def create
        user = User.new(user_params)
        user.password = params[:password]
        debugger
        if user.save
            login_user!(user)
            redirect_to cats_url
        else
            #show_errors
            render :new
        end
    end

    private

    def user_params
        params.require(:users).permit(:user_name, :password_digest, :session_token)
    end
end