FactoryBot.define do
  factory :destination_purchase_history do
    postal_code{'123-4567'}
    prefecture_id{2}
    municipality{'東京都'}
    address{'新宿区1-1'}
    phone_number{'09012345678'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
