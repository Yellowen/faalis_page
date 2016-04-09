Fabricator :guest_group, class_name: 'Faalis::Group' do
  name 'Guest'
  role 'guest'
end

Fabricator :user, class_name: 'Faalis::User' do
  first_name Faker::Name.first_name
  last_name  Faker::Name.first_name
  email { sequence(:email) { |n| "person#{n}@example.com" } }
  groups(count: 1){ Fabricate(:guest_group) }
end
