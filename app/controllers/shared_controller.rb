class TimeFilter
  attr_accessor :from, :to
end

class SharedController < ApplicationController
  
  before_filter :set_segment, :set_section
  layout :determine_layout

  ATTACHMENT_INCLUDE = {:include => :resource_attachments}
  
  def news
    @news = News.find( params[:id] )
  end
  def news_pc
    @news = News.find_pc( :all, 'union', @union.id, true, params[:page] )
  end
  def news_obv
    @news = News.find_obv( :all, 'union', @union.id, true, params[:page] )
  end
  def news_archive
    @time_filter = TimeFilter.new
    if params[:time_filter]
      @time_filter.from = Date.civil(params[:time_filter][:"from(1i)"].to_i,params[:time_filter][:"from(2i)"].to_i,params[:time_filter][:"from(3i)"].to_i)
      @time_filter.to = Date.civil(params[:time_filter][:"to(1i)"].to_i,params[:time_filter][:"to(2i)"].to_i,params[:time_filter][:"to(3i)"].to_i)      
    elsif params[:day] and params[:month] and params[:year]
      @time_filter.from = @time_filter.to = Date.civil(params[:year].to_i, params[:month].to_i, params[:day].to_i)
    elsif params[:month] and params[:year]
      @time_filter.from = Date.civil(params[:month]).beginning_of_month
      @time_filter.to = Date.civil(params[:month]).end_of_month
    end
    @news = News.find_archive('union', @union.id, params[:page], @time_filter )
  end
  
  def organization
    @organization = Organization.find_for_union( :first, @union.id, ATTACHMENT_INCLUDE )
  end
  
  def rules
    @rules = Rules.find_for_union( :first, @union.id )
  end
  
  def links
  	@links = Link.find_for_union( :all, @union.id, :order => 'position, title' )
  end
  
  def departments
    options = {:include => :people, :order => 'departments.position'}
  	@departments = Department.find_for_union( :all, @union.id, options )
  end
  
  def gallery
  	@albums = Album.find_for_union( :all, @union.id, :order => 'date_taken DESC' )
  end
  def album
  	@album = Album.find_for_union( params[:id], @union.id )
  end
  def photo
  	@photo = Photo.find( params[:id] )
  	
  	@next_p = @photo.next
  	@prev_p = @photo.previous
  end
  
  def projects
    @projects = Project.find_for_union(:all, @union.id)
  end
  
  def project
    @project = Project.find_for_union(params[:id], @union.id)
  end
  
  def symbols
  	@symbolics = Symbolic.find_for_union( :all, @union.id )
  end
  
  def activities
    @activities = Activities.find_for_union( :first, @union.id )
  end
  
  def subsections
    if params[:id]
      @subsection = Subsection.find params[:id]
      render :template => 'shared/subsection'
    else
      @subsections = Subsection.find_for_union( :all, @union.id )
    end
  end
end