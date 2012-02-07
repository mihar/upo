# == Schema Information
# Schema version: 102
#
# Table name: universities
#
#  id            :integer(11)     not null, primary key
#  title         :string(255)
#  description   :text
#  url           :string(255)
#  websafe_title :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class University < ActiveRecord::Base
end
