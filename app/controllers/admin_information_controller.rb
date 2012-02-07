class AdminInformationController < ApplicationController
  
  before_filter :authenticate_zdus
 
 def index
    @information = Information.find 1
  end

  def update
    @information = Information.find 1
    if @information.update_attributes(params[:information])
      flash[:notice] = 'Informacije osvežene.'
      redirect_to zdus_contact_path
    else
      render :action => 'edit'
    end
  end

end
