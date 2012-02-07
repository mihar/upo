# == Schema Information
# Schema version: 102
#
# Table name: people
#
#  id            :integer(11)     not null, primary key
#  name          :string(255)
#  union_id      :integer(11)
#  telephone     :string(255)
#  fax           :string(255)
#  email         :string(255)
#  function      :string(255)
#  extra         :string(255)
#  image         :string(255)
#  department_id :integer(11)
#  address       :string(255)
#  post_id       :integer(11)
#  post          :string(255)
#  mobile        :string(255)
#  subunion_id   :integer(11)
#  position      :integer(11)
#

class Person < ActiveRecord::Base
	
	belongs_to :department
	validates_presence_of :name, :telephone
	
	file_column :image, :magick => {
    :versions => { "thumb" => "150x150", "square75" => { :crop => '1:1', :size => '75x75', :name => 'square75'}, "medium" => "640x480>" }
	}
	
	def self.find_zdus_kontaktne_osebe
		self.find :all, :conditions => ['extra = ?', 'kontaktne_osebe_zdus']
	end
	
	def full_name
	  self.name
	end
end
