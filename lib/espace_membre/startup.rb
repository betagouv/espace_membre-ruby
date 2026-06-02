module EspaceMembre
  class Startup < Record
    validates :ghid, presence: true

    belongs_to :incubator

    has_many :phases

    has_and_belongs_to_many :organizations, join_table: "startups_organizations"

    has_and_belongs_to_many :missions, join_table: "missions_startups"

    has_many :users, through: :missions

    has_one :evaluation, foreign_key: :startup_uuid

    has_one :latest_phase,
            -> { order(start: :desc) },
            class_name: "Phase",
            inverse_of: :startup

    scope :active, -> { in_phase(EspaceMembre::Phase::ACTIVE_PHASES) }

    # we must use this tragic hack because a startup can have one or
    # more phases without an 'end' timestamp, which is wrong and
    # misleading but that's how the data exists. So instead of
    # assuming 'phase.end = nil' designates the active and latest
    # phase, we have to always look at which one startet
    # last.
    scope :in_phase, ->(*phase) {
      joins(:phases)
        .where(phases: { name: phase })
        .where("phases.start = (SELECT MAX(p2.start) FROM phases p2 WHERE p2.startup_id = startups.uuid)")
    }

    def in_phase?(name)
      latest_phase.name == name.to_s
    end

    def to_s
      name
    end
  end
end
