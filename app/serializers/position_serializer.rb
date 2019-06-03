class PositionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title
  has_many :users
end
