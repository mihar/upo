# Methods added to this helper will be available to all templates in the application.
module AdminAdminsHelper

  def determine_admin_status(admin)
    if admin
      content_tag :td, "DA", :class => 'yes'
    else
      content_tag :td, "NE", :class => 'no'
    end      
  end
  
  def determine_admin_union_status(admin)
    if admin.nil?
      content_tag :td, "NE", :class => 'no'
    else
      content_tag :td, admin.title, :class => 'yes'
    end      
  end

end
