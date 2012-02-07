# == Schema Information
# Schema version: 102
#
# Table name: photos
#
#  id          :integer(11)     not null, primary key
#  filename    :string(255)
#  album_id    :integer(11)
#  title       :string(255)
#  description :text
#  author      :string(255)
#  date        :date
#

class Photo < ActiveRecord::Base
	belongs_to :album, :counter_cache => true

	validates_presence_of :filename
	validates_presence_of :title
	validates_presence_of :author
	validates_presence_of :date
	
	file_column :filename, :magick => { 
    :versions => { "thumb" => { :crop => '1:1', :size => '100x100', :name => 'thumb'}, "small" => "320x240", "medium" => "800x600>" }
	}
	
	acts_as_ordered :order => 'id', :scope => :album

end
