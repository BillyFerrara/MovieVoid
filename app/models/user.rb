class User < ApplicationRecord
    has_secure_password
    has_many :reviews
    has_many :movies, through: :reviews

    scope :most_reviews, -> { joins(:reviews).group(:count).first }

end
