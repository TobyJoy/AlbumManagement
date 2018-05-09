require 'faker'

FactoryBot.define do
  factory :song do |f|
    f.song_title { Faker::Name.name }
    f.duration { Faker::Number.decimal(2) }
    f.music_album_id { Faker::Number.between(1, 10) }
  end
end