class ReviewsController < ApplicationController

    def index
        if params[:user_id]
            @user = User.find(params[:user_id])
            @reviews = @user.reviews 
        else
            @reviews = Review.all 
        end 
    end 

    def new
        @review = Review.new(user_id: params[:user_id])
    end 

    def create
        @review = Review.new(review_params)
        @review.save 
        @user = current_user
        redirect_to @user
        
    end 

    private

    def review_params
        params.require(:review).permit(:rating, :content, :movie_id, :user_id)
    end 



end
