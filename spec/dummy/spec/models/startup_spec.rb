require 'rails_helper'

RSpec.describe EspaceMembre::Startup, type: :model do
  subject(:startup) { FactoryBot.create(:startup, :in_investigation) }

  describe "factory" do
    it "has a valid factory" do
     expect(startup).to be_valid
    end

    %i[investigation construction acceleration].each do |phase_name|
      it "can create a startup in #{phase_name}" do
        startup = FactoryBot.create(:startup, "in_#{phase_name}".to_sym)

        expect(startup.reload).to be_in_phase phase_name
      end
    end
  end

  describe "lifecycle" do
    it "has a latest_phase" do
      expect(startup.latest_phase).not_to be_nil
    end

    context "when in the initial state" do
      it { is_expected.to be_in_investigation }
    end

    context "when the startup evolves" do
      before do
        startup.latest_phase.update!(end: DateTime.now)
        startup.phases.create!(start: DateTime.now, name: "construction")
      end

      it "updates the latest phase" do
        expect(startup.reload).to be_in_construction
      end
    end
  end

  describe "scopes" do
    %i[investigation construction acceleration].each do |phase_name|
      it "has a scope to identify a startup in #{phase_name}" do
        startup = FactoryBot.create(:startup, "in_#{phase_name}".to_sym)

        expect(EspaceMembre::Startup.in_phase(phase_name)).to contain_exactly(startup)
      end
    end

    it "picks the latest phase to decide" do
      startup = FactoryBot.create(:startup, :in_acceleration)

      expect(EspaceMembre::Startup.in_phase(:investigation)).not_to include startup
    end

    describe "[bug] there can be multiple active startup phases (without an end date)" do
      before do
        FactoryBot.create(:phase, :construction, startup: startup)
      end

      it "knows which one is the latest phase" do
        expect(startup.latest_phase.name).to eq "construction"
      end

      it "does not include the startup in the previous phase scope" do
        expect(described_class.in_phase(:investigation)).not_to include startup
      end

      it "includes the startup in the new phase scope" do
        expect(described_class.in_phase(:construction)).to include startup
      end
    end
  end
end
