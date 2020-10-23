class MoviesController < ApplicationController
    def index
        if params[:user_id]
            @user = User.find(params[:user_id])
            @movies = @user.movies 
        else
            @movies = Movie.all 
        end 
    end 
end
