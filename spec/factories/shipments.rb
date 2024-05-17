FactoryBot.define do
  factory :shipment do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { 'Sample City' }
    street_address { 'Sample Street 1-1' }
    building_name { 'Sample Building' }
    phone_number { '09012345678' }
    association :order
  end
end
