class AddProfilepicToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_url, :string, :default => "https://api.adorable.io/avatars/285/sebby.png"
  end
end
