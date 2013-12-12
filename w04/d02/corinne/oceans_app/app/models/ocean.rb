# == Schema Information
#
# Table name: oceans
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  area          :integer
#  avg_depth     :integer
#  max_depth     :integer
#  deepest_place :text
#  image         :text
#

class Ocean < ActiveRecord::Base
  attr_accessible :name, :area, :avg_depth, :max_depth, :deepest_place, :image
end

