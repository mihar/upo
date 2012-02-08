set :application, "zdus-zveza.si"
set :domain, "racker-zdus"
set :deploy_to, "/webroot/zdus"
set :repository, 'git@github.com:mihar/upo.git'
set :scm, 'git'

namespace :vlad do
  
  desc "Symlinks stuff"
  remote_task :symlink do
    puts "Linking shared stuff to current release..."
    run "ln -s #{shared_path}/database.yml #{current_release}/config"
    run "ln -s #{shared_path}/rvmrc #{current_release}/.rvmrc"
    run "ln -s #{shared_path}/setup_load_paths.rb #{current_release}/config"
  end

  remote_task :update do 
    Rake::Task['vlad:symlink'].invoke
  end
  
  desc "Deploy application"
  remote_task :deploy do 
    system("git push")    
    Rake::Task['vlad:update'].invoke
    Rake::Task['vlad:migrate'].invoke
    Rake::Task['vlad:start_app'].invoke
  end
  
  desc "Maintenance ON"
  remote_task :mon do
    puts "MAINTENANCE !!!"
    run "cp #{current_release}/public/maintenance_.html #{current_release}/public/maintenance.html"
  end
  
  desc "Maintenance OFF"
  remote_task :moff do
    puts "MAINTENANCE OFF ..."
    run "rm #{current_release}/public/maintenance.html"
  end
  
  desc "Cleanup SASS leftovers"
  remote_task :cleanup_sass do
    puts "Cleaning up SASS leftovers..."
    run "rm #{current_release}/public/stylesheets/*.css; cp #{scm_path}/repo/public/stylesheets/lightbox.css #{current_release}/public/stylesheets/lightbox.css;"
  end
  
  remote_task :start_app => :cleanup_sass
end