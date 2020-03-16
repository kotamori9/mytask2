class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :todo
      t.string :task_id
      t.string :user_id
      t.date :enddate
      t.timestamps
    end
  end
end
