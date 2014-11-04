lock '3.2.1'

set :application, 'coonekt'
set :repo_url, 'https://github.com/njsperez83/coonekt.git'

set :deploy_to, '/home/deploy/coonekt'
set :user, "deploy"
set :use_sudo, true

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

#set :keep_releases, 5

load 'deploy/assets'

namespace :deploy do

  namespace :assets do
    task :precompile, :roles => assets_role, :except => { :no_release => true } do
      run <<-CMD.compact
        cd -- #{latest_release} &&
        #{rake} RAILS_ENV=#{rails_env.to_s} #{asset_env} assets:precompile
      CMD
    end
  end

  desc "Symlink shared configs and folders on each release."
  task :symlink_configs do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/config/application.yml #{release_path}/config/application.yml"
    run "ln -nfs #{shared_path}/assets #{release_path}/public/assets"
  end

   desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'

end
