class AddArtworksTable < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.string :title
      t.string :location
      t.string :info
      t.text :image
      t.timestamps
    end
  end
end
