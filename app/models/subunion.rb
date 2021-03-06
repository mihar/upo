# == Schema Information
# Schema version: 102
#
# Table name: subunions
#
#  id                 :integer(11)     not null, primary key
#  title              :string(255)
#  address            :string(255)
#  postal_number      :integer(11)
#  telephone          :string(255)
#  president          :string(255)
#  email              :string(64)
#  logo               :string(255)
#  working_hours      :string(255)
#  locality           :string(255)
#  contact            :string(255)
#  description        :text
#  permalink          :string(255)
#  image              :string(255)
#  www                :string(255)
#  summary            :text
#  title_websafe      :string(255)
#  email_contact      :string(255)
#  email_contact_copy :string(255)
#

class Subunion < ActiveRecord::Base
  
	has_many :albums, :dependent => :destroy
	has_many :news, :dependent => :destroy
	has_many :links, :dependent => :destroy
	has_many :admins, :dependent => :destroy
	has_many :subsections, :dependent => :destroy
	has_many :symbolics, :dependent => :destroy
	has_many :sponsors, :dependent => :destroy
	has_many :departments, :dependent => :destroy
	has_many :unions
	has_one  :activities, :dependent => :destroy
	has_one  :rules, :dependent => :destroy
	has_one  :counter, :dependent => :destroy

	# Refresh URL link	
	before_create :refresh_websafe
	after_create :create_counter

  validates_presence_of :title
  validates_uniqueness_of :title_websafe

  # Logo in header
  file_column :logo, 
	    :magick => {
	      :versions => { 
	      "head" => '100x100>'
	    }}
	
	# Presentational image
	file_column :image, 
      :magick => {
        :versions => {
        "normal" => "400x300>",
        "thumb" => "100x100>"
      }}

	def description_formatted
	  RedCloth.new(self.description).to_html unless self.description.nil?
	end
	
	protected
	
	def create_counter
	  Counter.create({ :subunion_id => self.id, :count => 1 })
	end
	
	def refresh_websafe
	  self.title_websafe = self.title.make_search_engine_friendly
	end
	
end
