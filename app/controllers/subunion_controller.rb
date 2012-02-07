class SubunionController < ApplicationController
  
  layout "subunion"
  before_filter :set_segment_subunion, :set_section
  before_filter :count_visit, :only => :index
  

  def friendly
    u = Subunion.find_by_title_websafe params[:subunion_websafe]
    raise SubunionNotFound unless u
    redirect_to subu_index_path(:subunion_id => u.id)
  end

	def index
	 render :template => 'shared/index'
	end
	
	def contact
	  render :template => "shared/contact"
	end
	
	def about
	 render :template => "shared/about"
	end
  
end
