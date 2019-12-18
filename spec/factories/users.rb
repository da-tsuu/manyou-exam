FactoryBot.define do
  factory :user do
    name { "MyString" }
    email { "user@aaa.aaa" }
    password { "MyString" }
    admin { false }
  end
  factory :AdminUser, class: User do
    name { "Admin" }
    email { "admin@aaa.aaa" }
    password { "Admin1" }
    admin { true }
  end
end

