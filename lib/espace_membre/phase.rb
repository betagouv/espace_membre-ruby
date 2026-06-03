module EspaceMembre
  class Phase < Record
    belongs_to :startup

    PHASES = %w[
      investigation
      abandon-investigation
      construction
      acceleration
      consolidation
      abandon
      opere
      transfere
    ]

    PHASES.each do |phase|
      # define scopes for each state (Phase.success, Phase.alumni, etc.)
      scope phase, -> { where("phases.name": phase) }

      # define individual instance methods
      define_method "#{phase}?" do
        name == phase
      end
    end

    def to_s
      name
    end
  end
end
