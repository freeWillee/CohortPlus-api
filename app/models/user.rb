class User < ApplicationRecord
    has_secure_password
    has_many :tasks
    has_many :comments
    has_many :projects, through: :tasks
    belongs_to :position
end
