class AddColumnToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :title, :string, null: false
  end
end
