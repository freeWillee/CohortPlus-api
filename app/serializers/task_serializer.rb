class TaskSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :title, :content, :percent_complete, :due_date, :user_id, :project_id

  has_many :comments, as: :commentable
end
