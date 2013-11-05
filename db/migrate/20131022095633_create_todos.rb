class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.string :priority
      t.text :description
      t.boolean :completed
      t.belongs_to :Tasklist

      t.timestamps
    end
    add_index :todos, :Tasklist_id
  end
end
