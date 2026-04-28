module EspaceMembre
  class Startup < Record
    validates :ghid, presence: true

    belongs_to :incubator

    has_many :phases

    has_and_belongs_to_many :missions, join_table: "missions_startups"

    has_many :users, through: :missions

    has_one :evaluation, foreign_key: :startup_uuid

    has_one :latest_phase,
            -> { order(start: :desc) },
            class_name: "Phase",
            inverse_of: :startup

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

    Phase::PHASES.each do |name|
      define_method "in_#{name}?" do
        latest_phase.send("#{name}?")
      end
    end

    def in_phase?(name)
      send("in_#{name}?")
    end

    def to_s
      name
    end
  end
end
