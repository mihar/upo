# == Schema Information
# Schema version: 102
#
# Table name: categories
#
#  id                        :integer(11)     not null, primary key
#  title                     :string(255)
#  resource_categories_count :integer(11)     default(0)
#  standalone                :boolean(1)
#  position                  :integer(11)
#

class Category < ActiveRecord::Base
  
  has_many :resource_categories, :dependent => :destroy
  has_many :resources
  acts_as_list
  
  def standalone?
    (self.standalone == true)
  end
  
  # Archive finder - implemented two types of finders.
  def self.find_archive(id=nil, page=nil, time_filter=nil)
    if id
      conditions = "(resources.resource_category_id IN (" + ResourceCategory.find_all_by_category_id(id).map(&:id).join(',') + ")) "
    else
      conditions = 'TRUE '
    end

	  if time_filter and not time_filter.from.nil?
      conditions += "AND (resources.created_at between '#{time_filter.from} 00:00:00' and '#{time_filter.to} 23:59:59')"
    else
      conditions += "AND TRUE"
    end
	  @resources = Resource.paginate :conditions => conditions, :include => :resource_attachments, :page => page, :per_page => 20
	end
	
	def self.find_standalone
	  find :all, :conditions => ['standalone = ?', true], :order => 'position'
	end
  
end
