# == Schema Information
#
# Table name: artworks
#
#  id        :integer          not null, primary key
#  title     :string(255)
#  year      :integer
#  photo     :text
#  artist_id :integer
#

class Artwork < ActiveRecord::Base
  attr_accessible :title, :year, :photo, :artist_id
  belongs_to :artist
end
