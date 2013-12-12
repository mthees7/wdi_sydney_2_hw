Artist.destroy_all
Artwork.destroy_all

a1 = Artist.create(:name => 'Banksy', :hometown => 'London', :profile_pic => 'http://www.streetartutopia.com/wp-content/uploads/2013/10/Banksy-selling-Banksy-canvases-in-Central-Park.jpg')
a2 = Artist.create(:name => 'Eyesaw', :hometown => 'Dublin', :profile_pic => 'http://www.streetartutopia.com/wp-content/uploads/2011/05/eyesaw_street_art_8.jpg')
a3 = Artist.create(:name => 'Pavel Puhov', :hometown => 'Moscow', :profile_pic => 'http://www.streetartutopia.com/wp-content/uploads/2012/01/street_art_by_pavel_puhov_7.jpg')

w1 = Artwork.create(:title => 'Follow Your Dreams', :location => 'London', :info => 'text', :image => 'banksy_follow_your_dreams.jpeg')
w2 = Artwork.create(:title => 'Street Cleaning', :location => 'Paris', :info => 'text', :image => 'banksy_street_cleaning.jpg')
w3 = Artwork.create(:title => 'Wall Cleaning', :location => 'New York', :info => 'text', :image => 'banksy_wall_cleaning.jpg')
w4 = Artwork.create(:title => 'Birdcage', :location => 'Dublin', :info => 'text', :image => 'eyesaw_birdcage.jpg')
w5 = Artwork.create(:title => 'Bus Stop', :location => 'London', :info => 'text', :image => 'eyesaw_bus_stop.jpg')
w6 = Artwork.create(:title => 'Hanging', :location => 'Glasgow', :info => 'text', :image => 'eyesaw_hanging.jpg')
w7 = Artwork.create(:title => 'Bridge', :location => 'Moscow', :info => 'text', :image => 'pavel_puhov_bridge.jpg')
w8 = Artwork.create(:title => 'Bridge at Night', :location => 'Moscow', :info => 'text', :image => 'pavel_puhov_bridge_night.jpg')
w9 = Artwork.create(:title => 'Snow', :location => 'Moscow', :info => 'text', :image => 'pavel_puhov_snow.jpg')

a1.artworks = [w1, w2, w3]
a1.save
a2.artworks = [w4, w5, w6]
a2.save
a3.artworks = [w7, w8, w9]
a3.save