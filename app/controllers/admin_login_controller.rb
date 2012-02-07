class AdminLoginController < ApplicationController

	layout "login"

  def index
  	
    if request.post?
      admin = Admin.authenticate(params[:username], params[:password])
      
      if admin
        session[:admin_id] = admin.id

        # - haxor
				session[:admin_haxor] = true if admin.haxor?
				# - zdus admin
				session[:admin_zdus] = true if admin.zdus?
				# - union admin
				unless admin.union_id.blank?
				  unless Union.find(:all, :conditions => "id = #{admin.union_id}").empty?
					  session[:admin_union] = admin.union_id
  					# redirect to union page
  					redirect_to u_index_path(:subdomain => Union.find(admin.union_id).title_websafe)
  					return
					end
				end
				# - subunion admin
	      unless admin.subunion_id.blank?
	        unless Subunion.find(:all, :conditions => "id = #{admin.subunion_id}").empty?
  	      	session[:admin_subunion] = admin.subunion_id
  	      	# redirect to subunion page
  					redirect_to subu_index_path(:subunion_id => admin.subunion_id)
  					return
					end
	      end
	      
	      # General redirect to ZDUS.
	      redirect_to index_path
			else
        flash[:notice] = "Napačno uporabniško ime ali geslo. Poizkusite znova."
			end
			
		else
		  # If not post, we're just accessing the login form.
		  # Save referer URL.
		  flash[:back] = request.env["HTTP_REFERER"]
		end
  end

  def clear
    reset_session
    request.env["HTTP_REFERER"] ? (redirect_to :back) : (redirect_to index_path)
  end
  
  protected
  
  def redirect_back_or_to(alternative)
    unless flash[:back].nil?
      redirect_to flash[:back]
    else
      redirect_to alternative
    end
  end
end
