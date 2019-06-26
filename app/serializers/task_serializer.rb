class TaskSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :title, :content, :status, :due_date, :user_id, :project_id

  has_many :comments
end
