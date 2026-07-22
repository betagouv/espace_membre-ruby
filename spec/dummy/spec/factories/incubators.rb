require 'faker'

FactoryBot.define do
  factory :incubator, class: 'EspaceMembre::Incubator' do
    ghid { Faker::Internet.slug }
    uuid { Faker::Internet.uuid }
    title { Faker::Lorem.word }
  end
end
