class AdminResourceAttachmentController < ApplicationController
	
	before_filter :authenticate_section, :set_segment
	before_filter :setup_new, :only => [:new_file, :new_image, :new_link, :new_movie]
	before_filter :find_attachment, :only => [:edit, :update, :destroy]
  layout :determine_layout

  def create
    @attachment = ResourceAttachment.new(params[:attachment])

    if @attachment.save
      flash[:notice] = 'Priponka uspesno shranjena.'
      redirect_to_section
    else
      render :action => 'new'
    end
  end

  def update
    if @attachment.update_attributes(params[:attachment])
      flash[:notice] = 'Priponka je uspešno shranjena.'
      redirect_to_section
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    if @attachment and @attachment.destroy
      flash[:notice] = 'Priponka odstranjena.'
    else
      flash[:notice] = 'Napaka pri brisanju priponke!'
    end
    
    redirect_to_section
  end
  
  protected
  
  def redirect_to_section
    redirect_to admin_back_link
  end
  
  def setup_new
    @attachment = ResourceAttachment.new
    @attachment.page_id     = params[:page_id]
    @attachment.resource_id     = params[:resource_id]
    @attachment.resource_category_id     = params[:resource_category_id]
    @attachment.project_id      = params[:project_id]
    @attachment.department_id   = params[:department_id]
    @attachment.organization_id   = params[:membership_id]
    @attachment.activities_id   = params[:activities_id]
    @attachment.subsection_id   = params[:subsection_id]
  end
  
  def find_attachment
    @attachment = ResourceAttachment.find(params[:id])
  end
  
end
