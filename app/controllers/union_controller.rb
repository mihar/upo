class UnionController < ApplicationController
  
  layout "union"  
  before_filter :set_segment_union, :set_section
  before_filter :count_visit, :only => :index
  
  
  def friendly
    u = Union.find_by_title_websafe params[:union_websafe]
    raise UnionNotFound unless u
    redirect_to u_index_path(:union_id => u.id)
  end
  
  ###
  ###
  # COMMON FUNCTIONALITY
  #
  def index
	 render :controller => :shared, :action => :news_obv
	end
  
  def about
    render :template => "shared/about"
  end
  
  def contact
    render :template => "shared/contact"
  end
  
  protected


end
