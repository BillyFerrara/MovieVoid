class Review < ApplicationRecord
    belongs_to :user
    belongs_to :movie, counter_cache: true

    validates :content, presence: true
    validates :rating, presence: true 
end
