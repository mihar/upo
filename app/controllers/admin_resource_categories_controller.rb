class AdminResourceCategoriesController < ApplicationController

  before_filter :authenticate_zdus
  before_filter :find_resource_category, :except => [:index, :new, :create, :update_positions]
  before_filter :find_categories, :only => [:edit, :new]
  
  def index
    @categories = Category.find :all, :include => :resource_categories, :order => "categories.position, resource_categories.position"
    @resource_categories = ResourceCategory.find :all, :conditions => 'category_id IS NULL'
  end
  
  def new
    @resource_category = ResourceCategory.new
    @resource_category.category_id = params[:category_id]
  end

  def create
    @resource_category = ResourceCategory.new(params[:resource_category])
    if @resource_category.save
      flash[:notice] = 'Kategorija je bila uspešno ustvarjena.'
      redirect_to_section
    else
      render :action => 'new'
    end
  end

  def update
    if @resource_category.update_attributes(params[:resource_category])
      flash[:notice] = 'Kategorija je bila uspešno shranjena.'
      redirect_to_section
    else
      render :action => 'edit'
    end
  end

  def destroy
    if @resource_category and @resource_category.destroy
      flash[:notice] = 'Kategorija uspešno izbrisana.'
    end
    redirect_to_section
  end
  
  def update_positions
    params.each { |key, value| @cat_sort = value if key.to_s =~ /cate/ }
    @cat_sort.each_with_index do |id, position|
      ResourceCategory.update(id, :position => position)
    end
    render :nothing => true
  end
  
  protected
  
  def redirect_to_section
    if params[:action] = 'destroy'
      redirect_to admin_tecum_resource_categories_path 
    else
      redirect_to res_path(@resource_category)
    end
  end
  
  def find_resource_category
    @resource_category = ResourceCategory.find params[:id]
  end

  def find_categories
    @categories = Category.find :all, :conditions => ['standalone = ?', false], :order => 'position'
  end
  
end