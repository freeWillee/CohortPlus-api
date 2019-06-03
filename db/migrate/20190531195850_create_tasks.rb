class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :content
      t.integer :percent_complete
      t.date :due_date
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
  end
end
