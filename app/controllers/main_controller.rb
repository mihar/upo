class TimeFilter
  attr_accessor :from, :to
end

class MainController < ApplicationController
  
  def index
    
  end
  
  # before_filter :set_segment_zdus, :except => [:unions, :subunions]
  before_filter :set_segment_union, :only => [:unions, :subunions]
  before_filter :load_projects, :only => [:projects, :project]
  before_filter :count_visit, :only => :index
  before_filter :set_section
  
  
  def subunions
    @subunions = Subunion.paginate :page => params[:page], :per_page => 20, :order => 'title'
  end
  def unions
    @unions = Union.paginate  :per_page => 20,
                              :page => params[:page],
                              :order => 'title'
  end
  
  def contact
    @departments = Department.find_for_zdus :all
  end

  def forms
    @forms = Form.find :all
  end

  def docs_read
    @docs = Doc.paginate_by_doc_category_id params[:id],
                                    :include => 'doc_category',
                                    :page => params[:page], 
                                    :per_page => 40
    
    @category = (@docs.empty?) ? DocCategory.find( params[:id] ) : @docs[0].doc_category
  end
  
  def category
    @category = ResourceCategory.find_all_by_category_id( params[:cat_id], :limit => 1 ).first
    if @category
      @resources = Resource.paginate_by_resource_category_id @category.id, :include => :resource_attachments, :page => params[:page], :per_page => 10
      render :template => 'main/resource'
    else
      @category = Category.find params[:cat_id]
      render :template => 'main/category'
    end
  end
  def category_archive
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
    @resources = Category.find_archive params[:cat_id], params[:page], @time_filter
    if params[:cat_id]
      @category = (@resources.empty?) ? Category.find( params[:cat_id] ) : @resources[0].resource_category.category
    end
  end
  
  def resource
    @resources = Resource.paginate_by_resource_category_id params[:id], 
                                    :include => [:resource_category, :resource_attachments],
                                    :page => params[:page], 
                                    :per_page => 10
    @category = (@resources.empty?) ? ResourceCategory.find( params[:id] ) : @resources[0].resource_category
  end
  
  def resource_read
    @resource = Resource.find params[:id], :include => [:resource_attachments, :category]
  end
  
  def project
    @project = @projects.find { |p| p.id == params[:id].to_i }
  end
  
  def today
    @resource = Resource.find_latest
  end

  def page
    @page = Page.find params[:id]
  end
  
  # def universities
  #   @universities = University.find :all
  # end
  
  def error
    render :layout => false
  end
  
  protected
  
  def load_projects
    @projects ||= Project.find :all, :order => 'position'
  end
end