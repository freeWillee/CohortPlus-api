class User < ApplicationRecord
    has_secure_password
    has_many :tasks
    has_many :comments
    has_many :projects, through: :tasks
    belongs_to :position

    def checkProfilePic(profileURLParams)
        if profileURLParams = "" 
            self.profile_url = "https://api.adorable.io/avatars/285/sebby.png"
        end
    end
end
