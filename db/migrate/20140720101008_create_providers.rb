class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.integer :user_id
      t.string :uid
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.string :provider
      t.string :type

      t.timestamps
    end
  end
end
