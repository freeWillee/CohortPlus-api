class RemoveTitleFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :title, :string
  end
end
