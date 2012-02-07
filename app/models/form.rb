# == Schema Information
# Schema version: 102
#
# Table name: forms
#
#  id    :integer(11)     not null, primary key
#  title :string(255)
#  file  :string(255)
#

class Form < ActiveRecord::Base
  
  validates_presence_of :title, :file
  
  file_column :file
  
end
