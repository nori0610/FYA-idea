class AddCategoryToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :category, :integer
  end
end
