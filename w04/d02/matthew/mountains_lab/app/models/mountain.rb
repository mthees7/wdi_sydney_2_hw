# == Schema Information
#
# Table name: mountains
#
#  id       :integer          not null, primary key
#  name     :string(255)
#  image    :text
#  height   :float
#  location :text
#

class Mountain < ActiveRecord::Base
  attr_accessible :name, :image, :height, :location
end
