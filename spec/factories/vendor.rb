FactoryBot.define do
  factory :vendor do
    sequence(:id) { |n| n }
    attributes {
      {
        name: Faker::Commerce.vendor,
        description: Faker::Commerce.material,
        contact_name: Faker::Name.name,
        contact_phone: Faker::PhoneNumber.phone_number,
        credit_accepted: Faker::Boolean.boolean 
      }
    }

    initialize_with { new(attributes.merge(id: id)) }
  end
end