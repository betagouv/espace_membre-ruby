module EspaceMembre
  class Team < Record
    validates :ghid, presence: true

    belongs_to :incubator
  end
end
