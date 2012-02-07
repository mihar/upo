module LinkHelpers
  
  def admin_link(which, params={})
	  send("admin_#{@segment}_#{which}_path", params)
	end
	def normal_link(which, params={})
	  send("#{@segment}_#{which}_path", params) 
	end
	
	# Generates a link back to the proper news section, based on the self news_type parameter.
	def normal_news_link
    normal_link("news_#{@news.news_type}") if @news
	end
	
	# Generates a link back to the proper section, that required the resource attachment, based on the set params id.
	def admin_back_link
	  if !params[:organization_id].blank? or ( !params[:attachment].blank? and !params[:attachment][:organization_id].blank? )
      return admin_link('organization')
    elsif !params[:department_id].blank? or ( !params[:attachment].blank? and !params[:attachment][:department_id].blank? )
      id = params[:department_id] || params[:attachment][:department_id]
      return admin_link('departments', {:action => 'edit', :id => id})
    elsif !params[:activities_id].blank? or ( !params[:attachment].blank? and !params[:attachment][:activities_id].blank? )
      return admin_link('activities')
    elsif !params[:subsection_id].blank? or ( !params[:attachment].blank? and !params[:attachment][:subsection_id].blank? )
      id = params[:subsection_id] || params[:attachment][:subsection_id]
      return admin_link('subsections', {:action => 'edit', :id => id})
    elsif !params[:page_id].blank? or ( !params[:attachment].blank? and !params[:attachment][:page_id].blank? )
      id = params[:page_id] || params[:attachment][:page_id]
      return admin_pages_path(:action => 'edit', :id => id)
    elsif !params[:resource_id].blank? or ( !params[:attachment].blank? and !params[:attachment][:resource_id].blank? )
      id = params[:resource_id] || params[:attachment][:resource_id]
      return admin_res_path(:action => 'edit', :id => id)
    elsif !params[:resource_category_id].blank? or ( !params[:attachment].blank? and !params[:attachment][:resource_category_id].blank? )
      id = params[:resource_category_id] || params[:attachment][:resource_category_id]
      return admin_tecum_resource_categories_path(:action => 'edit', :id => id)
    elsif !params[:project_id].blank? or ( !params[:attachment].blank? and !params[:attachment][:project_id].blank? )
      id = params[:project_id] || params[:attachment][:project_id]
      return admin_u_projects_path(:action => 'edit', :id => id)
    end

    return index_path
	end
	
	# Determines whether we should go back to a resource category or a standalone category.
	def link_to_res_back(resource)
	  return link_to_back res_path(resource.resource_category_id) if resource.resource_category_id
	  return link_to_back cat_path(resource.category_id) if resource.category_id
	end
	
	# Function automatically checks if URI has protocol specified, if not it adds the http.
	def uri_normalize(uri)
  	return 'http://' + uri unless uri =~ /http:\/\//
  	uri
	end
	
	# Returns a mailto link with the BCC parameter included if second email passed.
	def contact_mail_link(email, email_copy=nil)
	  mail_link = "mailto:#{email}"
	  mail_link += "?bcc=#{email_copy}" unless email_copy.blank?
	  mail_link
	end
	
	def link_to_more(where, text=nil, attachments=[])
  	  link_to 'Več ...', where, :class => 'link_to_more'
	end
	
	def link_to_wspan(what, where, options={})
	  link_to content_tag(:span, what), where, options	 
	end
end