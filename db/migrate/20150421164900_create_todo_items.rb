class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.integer :todo_list_id, null: false, index: true
      t.string :title, null: false
      t.boolean :done, null: false, default: false
      t.integer :next_id, index: true

      t.timestamps null: false
    end

    add_index :todo_items, [:todo_list_id, :next_id], unique: true
  end
end
