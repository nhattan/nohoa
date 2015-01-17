class AddCategoryId < ActiveRecord::Migration
  def change
  	add_column :bugs, :category_id, :integer
  	add_column :solutions, :category_id, :integer
  end
end
