
ActiveRecord::Schema.define(:version => 20131023215507) do

  create_table "artists", :force => true do |t|
    t.string   "name"
    t.string   "hometown"
    t.text     "profile_pic"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "artworks", :force => true do |t|
    t.string   "title"
    t.string   "location"
    t.string   "info"
    t.text     "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "artist_id"
  end

end
