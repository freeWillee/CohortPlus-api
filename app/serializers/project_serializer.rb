class ProjectSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :deadline, :calendar_url
  has_many :users, through: :tasks
  has_many :tasks
  has_many :comments, as: :commentable
end
