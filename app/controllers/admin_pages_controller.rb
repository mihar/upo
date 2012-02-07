class AdminPagesController < ApplicationController

  before_filter :authenticate_zdus
  before_filter :find_page, :except => [:index, :new, :create, :update_positions]
    
  def index
  end
  
  def new
    @page = Page.new
  end

  def create
    @page = Page.new(params[:page])
    if @page.save
      flash[:notice] = 'Stran je bila uspešno ustvarjena.'
      redirect_to_section
    else
      render :action => 'new'
    end
  end

  def update
    if @page.update_attributes(params[:page])
      flash[:notice] = 'Stran je bila uspešno shranjena.'
      redirect_to_section
    else
      render :action => 'edit'
    end
  end

  def destroy
    if @page and @page.destroy
      flash[:notice] = 'Stran uspešno izbrisana.'
    end
    redirect_to_section
  end
  
  def update_positions
    params[:pages].each_with_index do |id, position|
      Page.update(id, :position => position)
    end
    render :nothing => true
  end
  
  protected
  
  def redirect_to_section
    redirect_to admin_pages_path
  end
  
  def find_page
    @page = Page.find params[:id]
  end
  
end