#encoding: utf-8

Ocean.destroy_all

Ocean.create(:name => "Pacific", :area => 155557000, :avg_depth => 4028, :max_depth => 11033, :deepest_place => "Mariana Trench")
Ocean.create(:name => "Arctic", :area => 14056000, :avg_depth => 1205, :max_depth => 5625, :deepest_place => "77°45'N; 175°W")
