FactoryBot.define do
  factory :user do
    name { "MyString" }
    email { "MyString" }
    password { "MyString" }
    confirm_password { "MyString" }
    admin { false }
  end
end
