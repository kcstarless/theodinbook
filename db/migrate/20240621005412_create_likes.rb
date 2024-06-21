class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|
      t.integer :posted
      t.integer :liked

      t.timestamps
    end
  end
end
