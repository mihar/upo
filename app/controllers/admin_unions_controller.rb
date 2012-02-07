class AdminUnionsController < ApplicationController
  
  before_filter :authenticate

  def index
    @unions = Union.all
  end
  
  def new
    @union = Union.new
    @subunions = Subunion.find :all, :order => 'title'
  end

  def create
    @union = Union.new(params[:union])
    if @union.save
      flash[:notice] = 'Društvo uspešno ustvarjeno!'
      redirect_to_section @union.id
    else
      @subunions = Subunion.find :all, :order => 'title'
      render :action => 'new'
    end
  end

  def destroy
    if Union.find(params[:id]).destroy
      flash[:notice] = "Društvo uspešno izbrisano!"
    end
    redirect_to zdus_unions_path
  end
  
  protected
  
  def redirect_to_section(id)
    redirect_to u_index_path(:union_id => id)
  end
end
