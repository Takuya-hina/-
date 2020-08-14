class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :user_id, null: false
      t.integer :cmpost_id, null: false

      t.timestamps
      
      t.index :user_id
      t.index :cmpost_id
      t.index [:user_id, :cmpost_id], unique: true
    end
  end
end
