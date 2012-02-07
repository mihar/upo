class EventsController < ApplicationController

  layout 'subunion'
  before_filter :authenticate_subu, :send_admin_or_news, :current_subu

  def new
    @visits_of_event = VisitsOfEvent.new
    @visits_of_event.subunion_id = params[:subunion_id]
  end

  def create
    @visits_of_event = VisitsOfEvent.new(params[:visits_of_event])
    if @visits_of_event.save
      flash[:notice] = 'Organiziran obisk ustvarjen.'
      redirect_to_section
    else
      render :action => 'new'
    end
  end

  def edit
    @visits_of_event = VisitsOfEvent.find_for_subunion params[:id], params[:subunion_id]
  end

  def update
    @visits_of_event = VisitsOfEvent.find_for_subunion params[:id], params[:subunion_id]
    if @visits_of_event.update_attributes(params[:visits_of_event])
      flash[:notice] = 'Organiziran obisk osvežen.'
      redirect_to_section
    else
      render :action => 'edit'
    end
  end

  def destroy
    if VisitsOfEvent.find(params[:id]).destroy
      flash[:notice] = 'Organiziran obisk izbrisan.'
    end
    redirect_to_section
  end
  
  protected
  
  def redirect_to_section
    redirect_to subu_aktivnost_path
  end
end
