class Project < ApplicationRecord
    has_many :tasks
    has_many :users, through: :tasks
    has_many :comments, as: :commentable

    validates :title, presence: true
end
