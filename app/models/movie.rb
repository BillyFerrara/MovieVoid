class Movie < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews

    validates :title, presence: true
    validates :title, uniqueness: true
    
    scope :most_reviews, -> { joins(:reviews).group(:title).order(count_all: :desc).count}
end
