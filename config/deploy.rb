require 'capistrano/version'
set :application, "mycoolapp" 


namespace :deploy do
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end


server "audience1.east", :app
set :application, "mycoolapp"

set(:repository){ "git@github.groupon.com:surya/mycoolapp.git"}
set :scm, :git
set :copy_exclude, ".git"

set :user, :audiencedeploy
set :use_sudo, false
set :keep_releases, 10
set :deploy_env, 'production'
set (:deploy_to) {"/var/groupon/#{application}"}
default_run_options[:pty] = true



namespace :bundle do
  task :install do
    run  "cd /var/groupon/#{application}/current && sudo bundle install --without development test"
  end
end

namespace :setup do
  desc "roll our hosts.  default=all.  ROLE=[app|utility|haproxy] to scope it"
  task :roll do
    set :user, ENV['USER']
    run "cd /var/tmp; rm -f roll; wget http://config/package/roll; sudo chmod a+x roll"
    run "sudo /var/tmp/roll"
  end
end 

after "deploy:symlink", "bundle:install"
