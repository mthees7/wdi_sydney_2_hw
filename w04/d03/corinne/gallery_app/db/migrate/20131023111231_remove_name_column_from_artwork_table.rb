class RemoveNameColumnFromArtworkTable < ActiveRecord::Migration
  def change
    remove_column :artworks, :name
  end

end
