# frozen_string_literal: true

module EspaceMembre
  class Organization < Record
    has_and_belongs_to_many :startups, join_table: "startups_organizations"

    # EMDB has a `type` column which triggers ActiveRecord – but still
    # it is still kind enough to provide the following fix:
    self.inheritance_column = :null
  end
end
