lock '3.2.1'

set :application, 'coonekt'
set :repo_url, 'https://github.com/njsperez83/coonekt.git'

set :deploy_to, '/home/deploy/coonekt'
set :user, "deploy"
set :use_sudo, true

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

#set :keep_releases, 5


namespace :deploy do

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
