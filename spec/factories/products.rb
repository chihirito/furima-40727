FactoryBot.define do
  factory :product do
    association :user
    name { 'テスト商品' }
    description { 'テスト商品説明' }
    category_id { 2 }
    condition_id { 2 }
    shipping_fee_id { 2 }
    prefecture_id { 2 }
    shipping_duration_id { 2 }
    price { 1000 }

    after(:build) do |product|
      product.image.attach(io: File.open(Rails.root.join('public', 'images', 'test_image.png')), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
