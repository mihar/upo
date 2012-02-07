# == Schema Information
# Schema version: 102
#
# Table name: admins
#
#  id          :integer(11)     not null, primary key
#  name        :string(255)
#  surname     :string(255)
#  username    :string(255)
#  password    :string(255)
#  union_id    :integer(11)
#  haxor       :boolean(1)
#  email       :string(255)
#  zdus        :boolean(1)
#  subunion_id :integer(11)
#

require 'union_db_helper'

class Admin < ActiveRecord::Base
	belongs_to :union
	belongs_to :subunion
	
	validates_presence_of :name, :surname, :username, :password
	validates_uniqueness_of :username
	
	def name_and_surname
		unless self.name.nil? or self.surname.nil?
			self.name + ' ' + self.surname
		end
	end
	
	def haxor?
		self.haxor === true
	end
	
	def zdus?
	 self.zdus === true
	end
	
	def self.authenticate(username, password)
    self.find_by_username_and_password(username, password) 
  end
  
  def self.find_from_session(user_id, union_id)
  	unless user_id.blank?
  		unless union_id.blank? or (union_id == '0')
  			self.find :first, :conditions => ['id = ? AND (( union_id = ? ) OR ( union_id = ? ))', user_id, union_id, union_id]
  		else
  			self.find user_id
  		end
  	end
  end
  
  # Get the by current union finder.
  extend UnionDBHelper
end
