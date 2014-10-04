# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page do
    title "MyPage1"
    layout ""
    description "MyString"
    tags "tag1, tag2"
    permalink ""
    publish true
    raw_content "MyText"
  end
end
