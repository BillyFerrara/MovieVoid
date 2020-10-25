class UsersController < ApplicationController
    helper_method :set_user
    

    def index
        @users = User.all
    end 

    def show
        set_user
    end 

    def new
        @user = User.new
    end 

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id 
            redirect_to @user 
        else 
            render :new 
        end 
    end 

    def edit 
        if current_user != set_user
            redirect_to current_user
        end 
    end 

    def update
        set_user
        if @user.update_attributes(user_params)
            redirect_to @user 
        else 
            render 'edit'
        end 
    end 

    private

    def set_user
       @user = User.find(params[:id])
    end 

    def user_params
        params.require(:user).permit(:name, :username, :password, :uid, :provider)
    end 
end
