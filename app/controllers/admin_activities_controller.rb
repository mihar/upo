class AdminActivitiesController < ApplicationController
  
  before_filter :authenticate_section, :set_segment
  before_filter :find_activities
  layout :determine_layout


  def update
    if @activities.update_attributes(params[:activities])
      flash[:notice] = 'Dejavnost je osvežena.'
      redirect_to_section
    else
      render :action => 'index'
    end
  end

  protected
  
  def find_activities
    @activities = Activities.find_for_union( :first, @union.id, :include => :resource_attachments )
    
    unless @activities
      @activities = Activities.new({
        :union_id => @union.id,
        :subunion_id => params[:subunion_id],
        :activities => 'Podrocja delovanja'
      })
      @activities.save
    end
  end
  
  def redirect_to_section
    redirect_to normal_link('activities')
  end
end
