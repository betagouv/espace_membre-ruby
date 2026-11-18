module EspaceMembre
  class Incubator < Record
    validates :ghid, presence: true

    has_and_belongs_to_many :startups, join_table: "startups_incubators"

    def to_s
      title
    end
  end
end
