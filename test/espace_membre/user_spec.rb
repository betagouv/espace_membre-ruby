require 'rails_helper'

RSpec.describe EspaceMembre::User, type: :model do
  subject(:user) { FactoryBot.create(:user) }

  describe "factory" do
    it "has a valid factory" do
      expect(user).to be_valid
    end
  end

  describe "missions" do
    before do
      FactoryBot.create(:mission, user: user, employer: 'foo', end: 10.days.from_now)
      FactoryBot.create(:mission, user: user, employer: 'bar', end: Date.tomorrow)
    end

    it "orders the missions by end date" do
      expect(user.missions.map(&:employer)).to eq [ 'bar', 'foo' ]
    end

    it "can tell the latest mission" do
      expect(user.last_mission.employer).to eq 'foo'
    end
  end
end
