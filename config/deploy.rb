set :application, "Eldacon Company Tool"
set :repository,  "https://svn.eldacon.hu/svn/Develop/Ect/trunk"

set :scm, :subversion
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, "ect"
set :password, "gaZk63k6gdED2EH"
set :use_sudo, false
set :deploy_to, "/var/www/ect"
set :deploy_via, :copy

role :web, "ect@vm06.d2.eldacon.hu"                          # Your HTTP server, Apache/etc
role :app, "ect@vm06.d2.eldacon.hu"                          # This may be the same as your `Web` server
role :db,  "vm06.d2.eldacon.hu", :primary => true # This is where Rails migrations will run

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts
after "deploy", "deploy:bundle_gems"
after "deploy:bundle_gems", "bundle:restart"
# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
	task :bundle_gems do
		run "cd #{deploy_to}/current && bunlde install vendor/gems"
	end
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end