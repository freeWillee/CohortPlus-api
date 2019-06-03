class UserSerializer
  include FastJsonapi::ObjectSerializer

  attributes :username, :first_name, :last_name, :email, :title, :admin

  has_many :tasks
  has_many :projects, through: :tasks
  belongs_to :position
end
