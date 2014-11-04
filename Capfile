require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/rvm'
require 'capistrano/bundler'
require 'capistrano/rails'

set :rvm_type, :deploy
set :rvm_ruby_version, '2.1.3'
Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }
