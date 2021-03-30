FactoryBot.define do
  factory :user do
    api_key { "MyString" }
  end

  factory(:coffee) do
    blend_name {Faker::Coffee.blend_name}
    origin {Faker::Coffee.origin}
    notes {Faker::Coffee.notes}
  end
end