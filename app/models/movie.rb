class Movie < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews

    validates :title, presence: true
    validates :title, uniqueness: true
    
    scope :most_reviews, -> {order(reviews_count: :desc)}
end
