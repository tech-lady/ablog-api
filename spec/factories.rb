FactoryBot.define do
  factory :user do
    name  { 'Adeuser' }
    email { 'someborry@yahoo.com' }
    password { 'anywho01' }
  end

  factory :article do
    title { 'A testing Article' }
    content { 'This content is for testing that everything works' }
    author { 'Olauser' }
  end

  factory :commment do
    name { 'Opeuser' }
    content { 'My comment for testing is good' }
    visible { true }
  end
end
