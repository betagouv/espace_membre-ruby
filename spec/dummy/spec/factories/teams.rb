# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :team, class: 'EspaceMembre::Team' do
    incubator

    ghid { Faker::Internet.username }
    mission { Faker::Commerce.department }
    name { Faker::Commerce.product_name }
  end
end
