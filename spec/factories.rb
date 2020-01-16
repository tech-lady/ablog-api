FactoryBot.define do
  factory :user do
    name  { 'Adeuser' }
    sequence(:email) { |n| "person#{n}@example.com" }
    password { 'anywho01' }
  end

  factory :article do
    title { 'A testing Article' }
    content { 'This content is for testing that everything works' }
    author { 'Olauser' }
    user_id {rand(1..10)}
  end

  factory :comment do
    name { 'Openuser' }
    content { 'My comment for testing is good' }
    visible { true }
  end
end
