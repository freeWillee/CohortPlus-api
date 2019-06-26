class ProjectSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :deadline, :calendar_url
  has_many :users
  has_many :tasks
  has_many :comments
end
