class CreateTodoLists < ActiveRecord::Migration
  def change
    create_table :todo_lists do |t|
      t.integer :user_id, null: false, index: true
      t.integer :todo_item_head_id

      t.timestamps null: false
    end
  end
end
