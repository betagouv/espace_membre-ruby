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
      end
    end
  end
end
