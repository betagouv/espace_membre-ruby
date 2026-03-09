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

        FactoryBot.definition_file_paths += path if defined?(FactoryBotRails)

        FactoryBot.factories.clear

        FactoryBot.find_definitions
      end
    end
  end
end
