require 'bundler/capistrano'

set :application, "origin12"
set :repository,  "git@github.com:mjbamford/origin12.git"

set :scm, 'git'
set :git_shallow_clone, 1
set :user, 'mrcap'
set :runner, 'mrcap'
set :use_sudo, false

set :rails_env, 'staging'
set :whenever_environment, 'staging'
set :deploy_to, '/home/mrcap/origin12/staging'

default_run_options[:pty] = true

ssh_options[:port] = 1968
ssh_options[:username] = 'mrcap'

role :web, "ff01.friskyfactory.com"
role :app, "ff01.friskyfactory.com"
role :db,  "ff01.friskyfactory.com", :primary => true

after "deploy:symlink", "deploy:config_symlinks"

namespace :deploy do
  task :config_symlinks do
    run <<-CMD
      ln -s #{shared_path}/config/database.yml #{latest_release}/config/database.yml
    CMD
  end

  desc "Start nginx"
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  desc "Stop nginx (noop)"
  task :stop, :roles => :app do ; end

  desc "Restart nginx"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_release}/tmp/restart.txt"
    # run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  namespace :mysql do
    desc "Start mysql"
    task :start, :roles => :app do
      run "#{sudo} service mysql start"
    end

    desc "Stop mysql"
    task :stop, :roles => :app do
      run "#{sudo} service mysql stop"
    end

    desc "Restart mysql"
    task :restart, :roles => :app do
      run "#{sudo} service mysql restart"
    end
  end
end

