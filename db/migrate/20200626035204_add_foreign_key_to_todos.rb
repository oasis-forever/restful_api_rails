class AddForeignKeyToTodos < ActiveRecord::Migration[6.0]
  def change
    remove_column :todos, :created_by
    add_reference :todos, :user, null: false, foreign_key: true
  end
end
