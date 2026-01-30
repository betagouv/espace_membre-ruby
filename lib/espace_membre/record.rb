module EspaceMembre
  class Record < ActiveRecord::Base
    self.abstract_class = true

    # connects_to database: { writing: :default, reading: :default }
  end
end
