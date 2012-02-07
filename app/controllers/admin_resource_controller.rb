class AdminResourceController < ApplicationController

  before_filter :authenticate_zdus, :set_segment
  before_filter :find_resource, :except => [:new, :create]
  before_filter :find_categories, :only => [:new, :edit]
  
  
  def new
    @resource = Resource.new
    if params[:standalone]
      @resource.category_id = params[:category_id]
    else
      @resource.resource_category_id = params[:category_id]
    end
  end

  def create
    @resource = Resource.new(params[:resource])
    if @resource.save
      flash[:notice] = 'Vir je bil uspešno ustvarjen.'
      redirect_to_section
    else
      render :action => 'new'
    end
  end

  def update
    if @resource.update_attributes(params[:resource])
      flash[:notice] = 'Vir je bil uspešno shranjen.'
      redirect_to_section
    else
      render :action => 'edit'
    end
  end

  def destroy
    if @resource.resource_category_id
      id = @resource.resource_category_id
      standalone = false
    elsif @resource.category_id
      id = @resource.category_id
      standalone = true
    end
    
    if @resource and @resource.destroy
      flash[:notice] = 'Vir uspešno izbrisan.'
    end
    redirect_to_section(id,standalone)
  end
  
  protected
  
  def redirect_to_section(id=nil, standalone=nil)
    if id 
      if standalone
        redirect_to cat_path(id)
      else
        redirect_to res_path(id)
      end
    else
      if standalone
        redirect_to cat_path(params[:resource][:resource_category_id] || params[:resource][:category_id])
      else
        redirect_to res_path(params[:resource][:resource_category_id] || params[:resource][:category_id])
      end
    end
  end
  
  def find_resource
    @resource = Resource.find params[:id]
  end
  
  def find_categories
    if params[:standalone]
      @resource_categories = Category.find_standalone
    else
      @resource_categories = ResourceCategory.find :all
    end
  end

end