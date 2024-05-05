FactoryBot.define do
  factory :card do
    name { Faker::Creature::Animal.unique.name }
    set { Faker::Game.title }
    power { Faker::Number.between(from: 0, to: 10) }
    toughness { Faker::Number.between(from: 0, to: 10) }
    # image { Faker::Internet.url if [true, false].sample } 
    description { Faker::Lorem.paragraphs(number: rand(1..3), supplemental: true).join("\n\n") }
    
    # description { Faker::Lorem.paragraph(sentence_count: 3, supplemental: true, random_sentences_to_add: 4) }

  end

end
