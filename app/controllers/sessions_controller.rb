class SessionsController < ApplicationController
    def new
    end 

    def create

        if request.env['omniauth.auth']	
            byebug
            @user = User.find_or_create_by_omniauth(auth)
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
        # finds the user then authenticates the user by comparing the password in the db vs the password the user entered
        @user = User.find_by(username: params[:username])
            if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to @user 
            else 
            redirect_to login_path 
            end
        end 
    end 

    def destroy
        session.delete(:user_id)

        redirect_to homepage_path 
    end 

    private
    def auth
        request.env['omniauth.auth']
    end


end
