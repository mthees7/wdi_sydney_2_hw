class RenameColumnDoToDob < ActiveRecord::Migration
  def change
    rename_column :artists, :do, :dob
  end

end
