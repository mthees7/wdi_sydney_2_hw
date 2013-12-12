class AddArtworkTable < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.string :name
      t.string :title
      t.integer :year
      t.text :photo
      t.timestamp
    end
  end

end
