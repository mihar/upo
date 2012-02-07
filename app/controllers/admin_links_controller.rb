class AdminLinksController < ApplicationController

  before_filter :authenticate_union, :set_segment
  before_filter :find_link, :except => [:new, :create, :update_positions, :index]
  layout :determine_layout
  
  def index
    @links = Link.find_for_union(:all, @union.id, :order => 'position')
  end
  
  def new
    @link = Link.new
    @link.subunion_id = params[:subunion_id]
    @link.union_id = @union.id
  end

  def create
    @link = Link.new(params[:link])
    if @link.save
      flash[:notice] = 'Povezava je bila uspešno ustvarjena.'
      redirect_to_section
    else
      render :action => 'new'
    end
  end

  def update
    if @link.update_attributes(params[:link])
      flash[:notice] = 'Povezava je bila uspešno shranjena.'
      redirect_to_section
    else
      render :action => 'edit'
    end
  end

  def destroy
    if @link and @link.destroy
      flash[:notice] = 'Povezava uspešno izbrisana.'
    end
    redirect_to_section
  end
  
  def update_positions
    params[:links].each_with_index do |id, position|
      Link.update(id, :position => position)
    end
    render :nothing => true
  end
  
  protected
  
  def redirect_to_section
    redirect_to normal_link 'links'
  end
  
  def find_link
    @link = Link.find_for_union( params[:id], @union.id )
  end

end