# == Schema Information
#
# Table name: artists
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  hometown    :string(255)
#  profile_pic :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Artist < ActiveRecord::Base
  attr_accessible :name, :hometown, :profile_pic
  has_many :artworks
end
