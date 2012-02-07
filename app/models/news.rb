# == Schema Information
# Schema version: 102
#
# Table name: news
#
#  id          :integer(11)     not null, primary key
#  created_at  :datetime
#  summary     :text
#  text        :text
#  image       :string(255)
#  union_id    :integer(11)
#  subunion_id :integer(11)
#  title       :string(255)
#  author      :string(255)
#  show_zdus   :boolean(1)
#  show_pz     :boolean(1)
#  show_du     :boolean(1)
#  show_from   :datetime
#  show_until  :datetime
#  news_type   :string(255)
#

require 'union_db_helper'

class News < ActiveRecord::Base

	belongs_to :union
	belongs_to :subunion
	has_many :news_files

  validates_presence_of :title, :summary, :text
	
	# Find routines
  def self.find_news_type(what, for_what, union_id=nil, conditions=nil, paginate=false, page=1)
    conditions = {:conditions => conditions, :include => :news_files}

    if paginate
      (for_what == 'zdus') ? paginate_for_zdus(page, conditions) : send("paginate_for_#{for_what}", page, union_id, conditions)
    else
      (for_what == 'zdus') ? find_for_zdus(what, conditions) : send("find_for_#{for_what}", what, union_id, conditions)
    end
  end
  
	# Obvestila
	def self.find_obv(what, for_what, union_id=nil, paginate=false, page=nil)
	  conditions = "news.news_type='obv'"
	  find_news_type what, for_what, union_id, conditions, paginate, page
	end
	# Prispevki članov
	def self.find_pc(what, for_what, union_id=nil, paginate=false, page=nil)
	  conditions = "news.news_type='pc'"
	  find_news_type what, for_what, union_id, conditions, paginate, page
	end
	# Arhiv
	def self.find_archive(for_what, union_id=nil, page=nil, time_filter=nil)
	  if time_filter and not time_filter.from.nil?
      conditions = "news.created_at between '#{time_filter.from} 00:00:00' and '#{time_filter.to} 23:59:59'"
    end
    
	  find_news_type :all, for_what, union_id, conditions, true, page
	end
	
	
	
  # Datelimiting support
  def self.find_frontpage_zdus
   find_frontpage('zdus')
  end

  def self.find_frontpage_pz(union='')
   find_frontpage('pz', union)
  end

  def self.find_frontpage_du(union='')
   find_frontpage('du', union)
  end

  def self.find_frontpage(what, union='')
   cond = "((show_#{what} = '1')"

   unless union.blank?
     if what == 'pz'
       cond = cond + " or (subunion_id = #{union})"
     end
     if what == 'du'
       cond = cond + " or (union_id = #{union})"
     end
   end

   cond = cond + ") and ((show_from <= NOW()) and (NOW() <= show_until)) and (news_type = 'aktualno')"

   find :all, :conditions => cond, :order => 'date DESC'
  end

  def self.find_all_zdus(page=1)
   find_all('zdus', '', page)
  end

  def self.find_all_pz(union='', page=1)
   find_all('pz', union, page)
  end

  def self.find_all_du(union='', page=1)
   find_all('du', union, page)
  end

  def self.find_all(what, union='', page=1)
   cond = "(show_#{what} = '1')"

   unless union.blank?
     if what == 'pz'
       cond = cond + " or (subunion_id = #{union})"
     end
     if what == 'du'
       cond = cond + " or (union_id = #{union})"
     end
   end

   return paginate :page => page,
                   :per_page => 10,
                   :order => 'date DESC',
                   :conditions => cond
  end

	
	
	
  # Get the by current union finder.
  extend UnionDBHelper

  # Get the photo search from many routine.
  def photo
    return @photo if @photo
    
    self.news_files.each do |nf| 
      if nf.image?
        @photo ||= nf
      end
    end
    return @photo
  end
end
