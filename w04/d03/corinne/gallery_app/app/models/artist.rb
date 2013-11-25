# == Schema Information
#
# Table name: artists
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  dob         :string(255)
#  nationality :string(255)
#

class Artist < ActiveRecord::Base
  attr_accessible :name, :dob, :nationality
  has_many :artworks
end
