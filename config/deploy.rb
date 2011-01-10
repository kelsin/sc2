require "bundler/capistrano"

set :application, "sc2"

set :scm, :git
set :repository,  "kelsin@git.kelsin.net:~/repos/sc2.git"
set :branch, "master"
set :deploy_via, :remote_cache

role :web, "kelsin.net"
role :app, "kelsin.net"
role :db,  "kelsin.net", :primary => true

namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
 
  task :stop, :roles => :app do
    # Do nothing.
  end
 
  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
 
  desc "Symlink database and config files"
  task :symlink_shared, :roles => :app do
    ['database.yml', 'initializers/secret_token.rb', 'initializers/session_store.rb'].each do |path|
      run "ln -nfs #{shared_path}/config/#{path} #{release_path}/config/#{path}"
    end
  end
end
 
after 'deploy:update_code', 'deploy:symlink_shared'
