module EspaceMembre
  class User < Record
    self.primary_key = "uuid"

    DOMAINES = %w[
      Coaching
      Autre
      Produit
      Intraprenariat
      Data
      Déploiement
      Animation
      Design
      Développement
      Support
    ]

    has_and_belongs_to_many :teams, join_table: "users_teams"

    has_many :missions, -> { order '"end" ASC' }
    has_one :last_mission, -> { order(end: :desc) }, class_name: "EspaceMembre::Mission"

    has_many :startups, through: :missions

    has_many :active_missions, -> { active }, class_name: "EspaceMembre::Mission"
    has_many :active_startups, through: :active_missions, source: :startups

    validates :username, :fullname, :role, :domaine, presence: true
    validates :domaine, inclusion: { in: DOMAINES }

    def self.identify_email!(email)
      User.find_by!(primary_email: email)
    rescue ActiveRecord::RecordNotFound
      User.find_by!(secondary_email: email)
    end
  end
end
