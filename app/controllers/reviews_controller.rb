class ReviewsController < ApplicationController
    # before_action :set_review, only: [:edit, :update]

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

    def edit 
        @review = Review.find(params[:id])
    end 

    def update
        @review = Review.find(params[:id])

        if @review.update(review_params)
            redirect_to '/reviews'
        else 
            render 'edit'
        end 
        
    end 

    def show
        @review = current_user.reviews
    end 

    def destroy
        @review = current_user.reviews 
        @review.destroy 
        redirect_to '/reviews'
    end 

    private

    def review_params
        params.require(:review).permit(:rating, :content, :movie_id, :user_id)
    end 

    # def set_review
    #     byebug
    #     @review = Review.find(params[:id])
    # end 


end
