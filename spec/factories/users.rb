FactoryBot.define do
  factory :user do
    first_name 'John'
    last_name 'Doe'
    password '123456'
    password_confirmation '123456'
    email 'john@doe.com'
  end
end
