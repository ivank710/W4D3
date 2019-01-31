class SessionController < ApplicationController
    def new
        render :new
    end

    def create
        user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
        if user 
            login_user!(user)
            redirect_to cats_url
        else
            #show_errors
            render :new
        end
    end

     def destroy
        if @current_user
            @current_user.reset_session_token!
            session[:session_token] = nil
        end
     end
end