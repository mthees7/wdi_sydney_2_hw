# == Schema Information
#
# Table name: artworks
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  location   :string(255)
#  info       :string(255)
#  image      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null


class Artwork < ActiveRecord::Base
  attr_accessible :title, :location, :info, :image, :artist_id
  belongs_to :artist
end
