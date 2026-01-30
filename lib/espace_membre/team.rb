module EspaceMembre
  class Team < Record
    self.primary_key = "uuid"

    validates :ghid, presence: true

    belongs_to :incubator
  end
end
