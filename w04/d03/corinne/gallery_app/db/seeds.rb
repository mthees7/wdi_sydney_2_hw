Artist.destroy_all
Artwork.destroy_all

a1 = Artist.create(:name => 'Emily Carr', :dob => '13/12/1871', :nationality => 'Canadian')
a2 = Artist.create(:name => 'Pablo Picasso', :dob => '25/10/1881', :nationality => 'Spanish')

w1 = Artwork.create(:title => 'Still Life with a Bottle of Rum', :year => '1911', :photo => 'http://upload.wikimedia.org/wikipedia/en/7/7f/Pablo_Picasso%2C_1911%2C_Still_Life_with_a_Bottle_of_Rum%2C_oil_on_canvas%2C_61.3_x_50.5_cm%2C_Metropolitan_Museum_of_Art%2C_New_York.jpg')
w2 = Artwork.create(:title => "L'Homme aux cartes", :year => '1913', :photo => 'http://upload.wikimedia.org/wikipedia/en/3/39/Pablo_Picasso%2C_1913-14%2C_L%27Homme_aux_cartes_%28Card_Player%29%2C_oil_on_canvas%2C_108_x_89.5_cm%2C_Museum_of_Modern_Art%2C_New_York.jpg')
w3 = Artwork.create(:title => 'Kitwancool', :year => '1928', :photo => 'http://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Emily_Carr_1928_Kitwancool.png/486px-Emily_Carr_1928_Kitwancool.png')

a2.artworks = [w1, w2]
a1.artworks << w3

