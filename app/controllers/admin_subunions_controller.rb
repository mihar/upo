class AdminSubunionsController < ApplicationController
  
  before_filter :authenticate
  
  def new
    @subunion = Subunion.new
  end

  def create
    @subunion = Subunion.new(params[:subunion])
    if @subunion.save
      flash[:notice] = 'Zveza uspešno ustvarjena!'
      redirect_to_section @subunion.id
    else
      render :action => 'new'
    end
  end

  def destroy
    if Subunion.find(params[:id]).destroy
      flash[:notice] = "Zveza uspešno odstranjena!"
    end
    redirect_to zdus_subunions_path
  end
  
  protected
  
  def redirect_to_section(id)
    redirect_to subu_index_path(id)
  end
end
