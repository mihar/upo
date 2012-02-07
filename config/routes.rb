ActionController::Routing::Routes.draw do |map|
  
  
# Simple requirements, validation.  
id_requirement     = /\d+/
action_requirement = /[A-Za-z]\S*/
union_websafe_requirement = /[A-Za-z\-]\S*/





###
###
### ADMINISTRACIJA COMMON
###
################################################
################################################
  
# Administrative login
map.adminlogin '/a/',
              :controller => 'admin_login',
              :action => 'index'
# Administrative logout
map.adminlogout '/a/odjava/',
              :controller => 'admin_login',
              :action => 'clear'

# Public route name
segment_name = [
      'galerija', 'povezave', 'sekcije',      'vodstvo',       'organizacija',   'dejavnost',  'simboli',  'novice',  'novice_priponke',   'priponke',          'projekti',   'projekti'
      ]
# Admin controller names                                                                           
segment_admin_controller = [                                                                       
      'gallery',  'links',    'subsections',  'departments',  'organization', 'activities',   'symbols',   'news',    'news_file',      'resource_attachment',  'projects',   false
      ]                                                                                            
# Public view action names                                                                         
segment_public_controller_action = [                                                               
      'gallery',  'links',    'subsections',  'departments',  'organization', 'activities',   'symbols',   false,    false,             false,                  'projects',   'project'
      ]                                                                                            
# No ID.                                                                                           
no_id = [                                                                                          
      true,       false,      false,          true,           false,        true,           false,       false,     false,            false,                    true,         false
      ]                                                                                                        

segment_name.each_with_index do |name, idx|

  ##
  ##
  ## ADMIN ROUTES
  ##
  if segment_admin_controller[idx]
  controller  = "admin_#{segment_admin_controller[idx]}"
  # Union admin routes
  named_route = "admin_u_#{segment_admin_controller[idx]}"
  route_path  = "/a/#{name}/:action/:id"
  map.send(
    named_route, 
    route_path, 
    { :controller => controller, :conditions => {:subdomain => true} }
  )
  end
  
  ##
  ##
  ## PUBLIC ROUTES
  ##

  # Skip public routes if no public action.
  next if not segment_public_controller_action[idx]
  
  # Public shared controller name
  public_controller = 'shared'

  # Union routes
  named_route = "u_#{segment_public_controller_action[idx]}"
  route_path  = "/#{name}"
  route_path += "/:id" unless no_id[idx]
  controller  = public_controller
  action      = segment_public_controller_action[idx]
  map.send(
    named_route, 
    route_path, 
    { :controller => controller, :action => action, :id => nil, :conditions => {:subdomain => true} }
  )
end

# News path
news_actions=['obv',       'pc',       'archive']
             ['obvestila', 'prispevki-clanov', 'arhiv'].each_with_index do |category, idx|
  
  options = {  }
  map.send(
    "u_news_#{news_actions[idx]}", 
    "/novice/#{category}",
    {:controller => 'shared', :action => "news_#{news_actions[idx]}", :conditions => {:subdomain => true}}
  )

end



###
###
### ADMINISTRACIJA TECUM
###
################################################
################################################

map.admin_tecum_unions '/a/drustva-upokojencev/:action/:id',
                  :controller => 'admin_unions',
                  :id => nil 

map.admin_tecum_subunions '/a/pokrajinske-zveze/:action/:id',
                  :controller => 'admin_subunions',
                  :id => nil

map.admin_tecum_admins '/a/administratorji/:action/:id',
                  :controller => 'admin_admins',
                  :id => nil

map.admin_tecum_resource_categories '/a/podkategorije/:action/:id',
                  :controller => 'admin_resource_categories',
                  :action => 'index',
                  :id => nil

map.admin_tecum_categories '/a/kategorije/:action/:id',
                  :controller => 'admin_categories',
                  :action => 'index',
                  :id => nil



###
###
### ADMINISTRACIJA DRUŠTVA
###
################################################
################################################

# Union admin union.
map.admin_u_information '/a/o-nas',
              :controller => 'admin_union',
              :action => 'edit'








map.with_options :conditions => {:subdomain => true} do |u|
  # O nas
  u.u_about '/o-nas',
                :controller => 'union',
                :action => 'about'
  # Kontakt
  u.u_contact '/kontakt',
                :controller => 'union',
                :action => 'contact'
                
                

  # Galerija
  u.u_album '/galerija/:id',
                :controller => 'shared',
                :action => 'album'
  u.u_photo 'galerija/slika/:id',
                :controller => 'shared',
                :action => 'photo'
  # Novice preberi
  u.u_news_read '/novice/:id',
                :controller => 'shared',
                :action => 'news',
                :id => id_requirement
end




# Index page
map.index   '',
              :controller => 'shared',
              :action => 'news_obv',
              :conditions => { :subdomain => true }
map.u_index '',
              :controller => 'shared',
              :action => 'news_obv',
              :conditions => { :subdomain => true }


# Exception logging
map.connect "/a/napake/:action/:id", :controller => "logged_exceptions"
map.error "/error", :controller => 'main', :action => 'error'
end
