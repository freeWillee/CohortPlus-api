class UserSerializer
  include FastJsonapi::ObjectSerializer

  attributes :username, :first_name, :last_name, :email, :admin, :profile_url

  has_many :tasks, serializer: TaskSerializer
  has_many :projects, serializer: ProjectSerializer
  belongs_to :position
end
