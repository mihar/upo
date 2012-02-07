# == Schema Information
# Schema version: 102
#
# Table name: rules
#
#  id          :integer(11)     not null, primary key
#  rules       :text
#  union_id    :integer(11)
#  subunion_id :integer(11)
#

require 'union_db_helper'

class Rules < ActiveRecord::Base
  
  belongs_to :union
	belongs_to :subunion
  
  def rules_formatted
    RedCloth.new(self.rules).to_html unless self.rules.nil?
  end
  
  # Get the by current union finder.
  extend UnionDBHelper
  
end
