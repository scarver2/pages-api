# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page, :class => 'Page' do
    title Faker::Lorem.sentence
    content Faker::Lorem.sentences
    published_on Time.now # "2012-08-11 11:48:19"
  end
end
