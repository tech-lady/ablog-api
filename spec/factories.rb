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
    user
  end

  factory :commment do
    name { 'Opeuser' }
    content { 'My comment for testing is good' }
    visible { true }
  end
end
