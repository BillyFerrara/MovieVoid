class User < ApplicationRecord
    has_secure_password
    has_many :reviews
    has_many :movies, through: :reviews

    scope :most_reviews, -> { joins(:reviews).group(:count).first }
    # joins the users(self) and reviews db, maps through them, and selects the user with the most reviews associated with it
end
