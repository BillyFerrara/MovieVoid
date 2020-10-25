class User < ApplicationRecord
    has_secure_password
    has_many :reviews
    has_many :movies, through: :reviews
    
    validates :username, uniqueness: true
    validates :username, :password, presence: true

    scope :most_reviews, -> { joins(:reviews).group(:count).first }
    # joins the users(self) and reviews db, maps through them, and selects the user with the most reviews associated with it
                # auth is a hash coming from github
    def self.find_or_create_by_omniauth(auth)
        user = User.find_by(uid: auth['uid'])

        if user.nil?
            user = User.create(email: auth['info']['email'], username: auth['info']['nickname'], password: SecureRandom.hex, uid: auth['uid'])
        elsif user.uid.nil?
            user.update(uid: auth['uid'])
        end 
        user 
    end 

end
