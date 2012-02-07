# == Schema Information
# Schema version: 102
#
# Table name: resources
#
#  id                         :integer(11)     not null, primary key
#  title                      :string(255)
#  text                       :text
#  author                     :string(255)
#  union_id                   :integer(11)
#  subunion_id                :integer(11)
#  resource_attachments_count :integer(11)     default(0)
#  created_at                 :datetime
#  updated_at                 :datetime
#  summary                    :text
#  resource_category_id       :integer(11)
#

class Resource < ActiveRecord::Base
  
  has_many :resource_attachments, :dependent => :destroy
  belongs_to :resource_category, :counter_cache => true
  belongs_to :category

  validates_presence_of :title, :text, :summary
  
  def photo
    return @photo if @photo
    
    self.resource_attachments.each do |ra| 
      if ra.image?
        @photo ||= ra
      end
    end
    return @photo
  end

  def self.find_latest
    find :first, :order => 'created_at DESC'
  end
  
end
