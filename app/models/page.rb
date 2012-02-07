class Page < ActiveRecord::Base
  
  has_many :resource_attachments
  acts_as_list
  
end
