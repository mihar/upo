module UnionHelper
  def link_to_unless_blank_uri(display_string, uri)
    return display_string unless uri != nil
    
    link_to display_string, uri
  end
  
  def link_to_unless_blank_mail(display_string, mail)
    return display_string unless mail != nil
    
    mailto_uri = "mailto:" + mail
    link_to display_string, mailto_uri
  end
    
end
