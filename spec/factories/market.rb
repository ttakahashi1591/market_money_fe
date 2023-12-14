FactoryBot.define do
  factory :market do
    sequence(:id) { |n| n }
    attributes {
      {
        name: Faker::Company.name,
        city: Faker::Address.city,
        state: Faker::Address.state_abbr
      }
    }

    initialize_with { new(attributes.merge(id: id)) }
  end
end