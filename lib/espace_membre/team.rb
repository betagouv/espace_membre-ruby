module EspaceMembre
  class Team < Record
    validates :ghid, presence: true

    belongs_to :incubator

    has_and_belongs_to_many :users, join_table: "users_teams"
  end
end
