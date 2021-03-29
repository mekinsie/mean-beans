FactoryBot.define do
  factory(:coffee) do
    blend_name {Faker::Coffee.blend_name}
    origin {Faker::Coffee.origin}
    notes {Faker::Coffee.notes}
  end
end