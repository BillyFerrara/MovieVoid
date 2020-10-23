class MoviesController < ApplicationController
    def index
        if params[:user_id]
            @user = User.find(params[:user_id])
            @movies = @user.movies 
        else
            @movies = Movie.all 
        end 
    end 

    def new
        @movie = Movie.new
    end 

    def create 
        @movie = Movie.new(movie_params)
        if @movie.save 
            @user = current_user 
            
             redirect_to @user
            
        else 
            render :new 
        end 
    end 

    private

    def movie_params
        params.require(:movie).permit(:title)
    end 
end
