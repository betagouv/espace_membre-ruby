require 'faker'

FactoryBot.define do
  factory :mission, class: 'EspaceMembre::Mission' do
    uuid { Faker::Internet.uuid }
    start { Date.today }
    add_attribute(:end) { Date.tomorrow }
    employer { Faker::Company.name }
  end
end
