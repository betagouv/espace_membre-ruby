# frozen_string_literal: true

module EspaceMembre
  class MissionStartup < Record
    self.table_name = "missions_startups"

    belongs_to :mission
    belongs_to :startup_id
  end
end
