class AdminCategoriesController < ApplicationController

  before_filter :authenticate
  before_filter :find_category, :except => [:index, :new, :create, :update_positions]
  
  def index
    @categories = Category.find :all, :include => :resource_categories, :order => 'categories.position'
  end
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:notice] = 'Kategorija je bila uspešno ustvarjena.'
      redirect_to_section
    else
      render :action => 'new'
    end
  end

  def update
    if @category.update_attributes(params[:category])
      flash[:notice] = 'Kategorija je bila uspešno shranjena.'
      redirect_to_section
    else
      render :action => 'edit'
    end
  end

  def destroy
    if @category and @category.destroy
      flash[:notice] = 'Kategorija uspešno izbrisana.'
    end
    redirect_to_section
  end
  
  def update_positions
    params[:categories].each_with_index do |id, position|
      Category.update(id, :position => position)
    end
    render :nothing => true
  end
  
  protected
  
  def redirect_to_section
    redirect_to admin_tecum_categories_path
  end
  
  def find_category
    @category = Category.find params[:id]
  end

end