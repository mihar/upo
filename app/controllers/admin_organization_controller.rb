class AdminOrganizationController < ApplicationController
  
  before_filter :authenticate_section, :set_segment
  before_filter :find_organization
  layout :determine_layout
  
  def index
    unless @organization
      @organization = Organization.create({:subunion_id => params[:subunion_id], :union_id => @union.id, :organization => 'Članstvo' })
    end
  end

  def update
    if @organization.update_attributes(params[:organization])
      flash[:notice] = 'Organiziranost je osvežena.'
      redirect_to_section
    else
      render :action => 'index'
    end
  end
  
  
  protected
  
  def find_organization
    @organization = Organization.find_for_union( :first, @union.id )
  end
  
  def redirect_to_section
    redirect_to normal_link('organization')
  end
end
