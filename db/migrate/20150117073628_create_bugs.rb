class CreateBugs < ActiveRecord::Migration
  def change
    create_table :bugs do |t|
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
