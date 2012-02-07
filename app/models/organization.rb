# == Schema Information
# Schema version: 102
#
# Table name: organizations
#
#  id           :integer(11)     not null, primary key
#  organization :text
#  union_id     :integer(11)
#  subunion_id  :integer(11)
#  created_at   :datetime
#  updated_at   :datetime
#

class Organization < ActiveRecord::Base

  belongs_to :union
  belongs_to :subunion
  has_many :resource_attachments

  extend UnionDBHelper

end
