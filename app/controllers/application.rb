class ApplicationController < ActionController::Base
  # Pick a unique cookie name to distinguish our session data from others.
  session :session_key => '_zuo_session_id'
    
  # Requirements.
  include AuthenticationSystem, LinkHelpers, Segmentation, ExceptionLoggable, CounterSystem

  # Get menu categories
  before_filter :get_menu_categories, :get_union_data
  
  # Initiate admin determinator helpers.
  helper_method :admin?, :admin_u?, :admin_union?, :admin_subu?, :admin_zdus?, :admin_tecum?, :in_zdus?, :in_union?, :in_subunion?
  # Link helpers.
  helper_method :admin_link, :normal_link, :normal_news_link, :admin_back_link, :uri_normalize, :segment
  

  protected
  
  alias_method :admin_tecum?, :admin?
  
  # Redirect to index action and display a flash message.
  def redirect_to_index(message)
  	flash[:notice] = message
  	redirect_to :action => 'index'
  end
  
  # Sets the section based on the current action.
  def set_section
    @section ||= action_name
    # @section = 'news' if @section =~ /news/
  end  
  
  def get_menu_categories
    @categories = Category.find( :all, :include => :resource_categories, :order => 'categories.position, resource_categories.position' ) if in_zdus?
    @pages = Page.find(:all, :order => 'position') if in_zdus?
  end
  
  
  # Get data needed on every page (union data, and especially counter).
  def get_union_data
    @union ||= Union.find_by_permalink( current_subdomain )
    redirect_to error_path if @union.nil?
    @counter = @union.counter if @union
  end
  
end