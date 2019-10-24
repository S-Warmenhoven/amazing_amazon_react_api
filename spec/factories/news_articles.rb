FactoryBot.define do
  factory :news_article do
    sequence(:title) { |n| Faker::Book.title + " #{n}" }
    description { Faker::Hacker.say_something_smart }
  end
end