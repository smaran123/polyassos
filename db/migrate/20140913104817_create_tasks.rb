class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.date :completiondate
      t.string :status
      t.text :comment
      t.string :assign_to
      t.integer :worker_id
      t.timestamps
    end
  end
end
