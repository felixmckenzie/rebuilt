FactoryBot.define do
  factory :address do
    street_number { "MyString" }
    street_name { "MyString" }
    suburb { "MyString" }
    state { "MyString" }
    postcode { "MyString" }
    country { "MyString" }
    user { nil }
  end
end
