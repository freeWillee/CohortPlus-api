class TaskSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :title, :content, :percent_complete, :due_date, :user_id, :project_id

  belongs_to :user
  belongs_to :project
end
