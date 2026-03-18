require 'rails_helper'

RSpec.describe EspaceMembre::User, type: :model do
  include ActiveSupport::Testing::TimeHelpers

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

  describe "scopes" do
    describe ".expired" do
      subject(:scope) { described_class.expired }

      let(:user) { FactoryBot.create(:user, :with_active_mission) }

      context "when the user has an active mission" do
        it { is_expected.not_to include user }
      end

      context "when then user's mission ends today" do
        before { travel_to(user.last_mission.end) }

        it { is_expected.not_to include user }
      end

      context "when the user's last mission is past" do
        before { travel_to(user.last_mission.end + 1.day) }

        it { is_expected.to include user }
      end
    end
  end
end
