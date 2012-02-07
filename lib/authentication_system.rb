module AuthenticationSystem
  
  protected
  
  # Authentication method
  def authenticate
    set_segment_tecum
  	authenticate_without_segment
  end
  def authenticate_without_segment

  end
  def authenticate_section
    authenticate_union if in_union?
    authenticate_subu if in_subunion?
    authenticate_zdus if in_zdus?
  end
  def authenticate_union

  end  
  def authenticate_subu

  end  
  def authenticate_zdus

  end
	
	# Admin status determination functions based on a value in the session that we set upon login.
 	def admin?
		is_admin?
	end
	def admin_union?
		is_admin? :admin_union, @union.id
	end
	def admin_u?
		is_admin? :admin_union, @union.id
	end
	def admin_subu?
		is_admin? :admin_subunion, params[:subunion_id]
	end
	def admin_zdus?
		is_admin? :admin_zdus
	end
	
	def is_admin?(which_privilege='', id='')
		# Return true if global admin.
		return true if session[:admin_haxor] === true
		# Return true if privilege set.
  	return true if session[which_privilege] === true
		
		unless id.blank?
		  # Return true if matches subunion or union ID.
		  return true if session[which_privilege].to_i === id.to_i
		end
		
		return false
	end
	


	# Redirect to admin login page.
	def redirect_to_login
		redirect_to adminlogin_path
	end

end