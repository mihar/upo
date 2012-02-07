class AdminSubunionController < ApplicationController
	
	layout 'subunion'
  before_filter :authenticate_subu

  def edit
    @subunion = Subunion.find params[:subunion_id]
    if params[:subunion]
      if @subunion.update_attributes(params[:subunion])
        flash[:notice] = 'Podatki o pokrajinski zvezi so bili uspešno shranjeni.'
        redirect_to_section
      else
        render :action => 'edit'
      end
    end
  end
  
  
  protected
  
  def redirect_to_section
    redirect_to subu_contact_path
  end
end
