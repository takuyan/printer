require "capistrano_colors"
require "bundler/capistrano"

set :application, "printer"
set :repository,  "git://github.com/takuyan/printer.git"
set :scm, :git
set :branch, 'master'
set :use_sudo, false
set :default_run_options, pty: true
set :user, "takuyan"
set :bundle_flags, "--quiet"
set :deploy_via, :copy

role :web, "printer.takuyan.com"
role :app, "printer.takuyan.com"
role :db,  "printer.takuyan.com", primary: true
set :deploy_to, "/home/takuyan/rails/printer"

#
# rbenv configuration
#
set :default_environment, {
  'RBENV_ROOT' => '$HOME/.rbenv',
  'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
}
set :bundle_flags, "--quiet --binstubs --shebang ruby-local-exec"

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, roles: :app, except: { no_release: true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

after "deploy:restart" do
  system("which -s growlnotify && growlnotify -n 'Capistrano' -t 'Capistrano' -m 'Deploy Complete'")
end
