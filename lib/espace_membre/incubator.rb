module EspaceMembre
  class Incubator < Record
    validates :ghid, presence: true

    has_many :startups

    def to_s
      title
    end
  end
end
