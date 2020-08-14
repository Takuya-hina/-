class AddColumnsToCmposts < ActiveRecord::Migration[5.2]
  def change
    add_column :cmposts, :cm_url, :string
    add_column :cmposts, :cm_title, :string
    add_column :cmposts, :cm_service, :string
    add_column :cmposts, :cm_music, :string
  end
end
