require 'faker'

FactoryBot.define do
  factory :music_album do |f|
    f.name { Faker::Name.name }
    f.genres { Faker::Name.name }
    f.artist { Faker::Name.name }
    f.user_id { Faker::Number.digit }
  end
end