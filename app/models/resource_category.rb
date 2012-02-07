# == Schema Information
# Schema version: 102
#
# Table name: resource_categories
#
#  id              :integer(11)     not null, primary key
#  title           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  resources_count :integer(11)     default(0)
#  category_id     :integer(11)
#

class ResourceCategory < ActiveRecord::Base
  
  has_many :resources, :dependent => :destroy
  has_many :resource_attachments
  
  belongs_to :category, :counter_cache => true
  acts_as_list :scope => :category
  
end
