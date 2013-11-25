class AddArtistTable < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :do
      t.string :nationality
      t.timestamp
    end
  end
end
