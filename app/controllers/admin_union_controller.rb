class AdminUnionController < ApplicationController
	
	layout 'union'
  before_filter :authenticate_union, :set_segment
  
  def edit
    if params[:union]
      if @union.update_attributes(params[:union])
        flash[:notice] = 'Podatki o društvu so bili uspešno shranjeni.'
        redirect_to_section
      else
        render :action => 'edit'
      end
    end
  end
  
  
  protected
  
  def redirect_to_section
    redirect_to u_contact_path
  end
end
