class AddCalendarUrlToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :calendar_url, :string
  end
end
