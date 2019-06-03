class CommentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :content, :commentable_type

  belongs_to :user
end
