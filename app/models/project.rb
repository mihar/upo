# == Schema Information
# Schema version: 102
#
# Table name: projects
#
#  id         :integer(11)     not null, primary key
#  title      :string(255)
#  manager    :string(255)
#  text       :text
#  summary    :text
#  created_at :datetime
#  updated_at :datetime
#  position   :integer(11)     default(0)
#

class Project < ActiveRecord::Base

  has_many :resource_attachments
  belongs_to :union
  validates_presence_of :title
  
  def photo
    return @photo if @photo
    
    self.resource_attachments.each do |ra| 
      if ra.image?
        @photo ||= ra
      end
    end
    return @photo
  end
  
  # Get the by current union finder.
  extend UnionDBHelper

end
