class AddArtistsTable < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :hometown
      t.text :profile_pic
      t.timestamps
    end
  end
end
