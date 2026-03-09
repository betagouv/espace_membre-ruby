module EspaceMembre
  class Railtie < ::Rails::Railtie
    initializer "emdb.setup" do
      ActiveSupport.on_load(:active_record) do
        require "espace_membre/record.rb"
        require "espace_membre/incubator.rb"
        require "espace_membre/mission.rb"
        require "espace_membre/mission_startup.rb"
        require "espace_membre/phase.rb"
        require "espace_membre/startup.rb"
        require "espace_membre/user.rb"

        path = [File.expand_path('../../../spec/dummy/spec/factories', __FILE__)]

        if defined?(FactoryBot)
          FactoryBot.class_eval do
            self.definition_file_paths += path

            factories.clear

            find_definitions
          end
        end
      end
    end
  end
end
