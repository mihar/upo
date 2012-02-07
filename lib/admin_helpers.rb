module AdminHelpers
  
  # Authentication helpers
	def admin_section(&block)
		unless @segment.blank?
    	concat(content_tag(:div, capture(&block), :class => 'admin'), block.binding) if admin? or send("admin_#{@segment}?")
  	end
	end
	def admin_name
    @admin ||= Admin.find(session[:admin_id]).name_and_surname
	end
	
	# General delete message.
	def del_conf_msg(identifier)
	  "Ste prepričani?"
	  "Ste prepričani? Izbrisano bo &raquo;#{identifier}&laquo;..."
	end
	
	# Outputs the submit button with the default caption and in the default nice 
  # container for stylement.
	def nice_submit_tag(label='Shrani')
	  content_tag :p, submit_tag(label), :class => 'submit'
	end
	
	def link_to_back(uri, caption='Nazaj')
	  link_to caption, uri, :class => 'btnBack'
	end
	
	# Get a nice key/value pair for the segment id in resource attachments.
	def keypair(field, id)
	  field_as_sym = "#{field}_id".to_sym
	  {field_as_sym => id}
	end
	
	
	######## DEPRECATED WILL MOVE OUT EVENTUALLY
	def draw_admin_section(&block)
    concat content_tag(:div, capture(&block), :class => 'admin'), block.binding
  end

  def admin_zdus_section(&block)
    if admin_zdus?
      draw_admin_section(&block)
    end
  end
  def admin_union_section(&block)
    if admin_union?
      draw_admin_section(&block)
    end
  end
  def admin_subu_section(&block)
    if admin_subu?
      draw_admin_section(&block)
    end
  end
end