class AdminDocCategoriesController < ApplicationController

  before_filter :authenticate_zdus
  before_filter :find_doc_category, :except => [:index, :new, :create]

  def index
    @doc_categories = DocCategory.find :all, :order => 'position'    
  end
  
  
  def new
    @doc_category = DocCategory.new
  end

  def create
    @doc_category = DocCategory.new(params[:doc_category])
    if @doc_category.save
      flash[:notice] = 'Kategorija je bila uspešno ustvarjena.'
      redirect_to_section
    else
      render :action => 'new'
    end
  end

  def update
    if @doc_category.update_attributes(params[:doc_category])
      flash[:notice] = 'Kategorija je bila uspešno shranjena.'
      redirect_to_section
    else
      render :action => 'edit'
    end
  end

  def destroy
    if @doc_category and @doc_category.destroy
      flash[:notice] = 'Kategorija uspešno izbrisana.'
    end
    redirect_to_section
  end
  
  protected
  
  def redirect_to_section
    redirect_to admin_zdus_doc_categories_path
  end
  
  def find_doc_category
    @doc_category = DocCategory.find params[:id]
  end
  
end