require 'capistrano'
require 'capistrano/log_with_awesome'
module Capistrano
  module GitVersion
    def self.extended(configuration)
      configuration.load do

        after 'deploy:update_code',  'deploy:save_version'

        set :git_version do
          `git ls-remote #{repository}| head -1 | sed 's/HEAD//'`
        end


        namespace :deploy do
            task :save_version do
              gversion = StringIO.new(git_version)
              top.upload(gversion, "#{release_path}/public/version.html")
            end
          end
        end
    end
  end
end

if Capistrano::Configuration.instance
  Capistrano::Configuration.instance.extend(Capistrano::GitVersion)
end
  
