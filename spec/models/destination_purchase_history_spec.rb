require 'rails_helper'

RSpec.describe DestinationPurchaseHistory, type: :model do
  describe '購入情報の保存'
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @destination_purchase_historiy = FactoryBot.build(:destination_purchase_history, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

 context '保存できる時' do
  it '全ての値が正しく入力されていれば保存できる' do
    expect(@destination_purchase_historiy).to be_valid
  end
  it 'buildingは空でも保存できる' do
    @destination_purchase_historiy.building = ''
    expect(@destination_purchase_historiy).to be_valid
  end
  it 'phone_numberが11桁以下であれば登録できる' do
    @destination_purchase_historiy.phone_number = '11111111111'
    expect(@destination_purchase_historiy).to be_valid
  end
 end
 context '保存できない時' do
  it 'postal_codeが空では保存できない' do
    @destination_purchase_historiy.postal_code = ''
    @destination_purchase_historiy.valid?
    expect(@destination_purchase_historiy.errors.full_messages).to include("Postal code can't be blank")
  end
  it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
    @destination_purchase_historiy.postal_code = '1234567'
    @destination_purchase_historiy.valid?
    expect(@destination_purchase_historiy.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
  end
  it 'postal_codeが半角のハイフンを含んでいても半角の整数でないと保存できない' do
    @destination_purchase_historiy.postal_code = '１２３-４５６７'
    @destination_purchase_historiy.valid?
    expect(@destination_purchase_historiy.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
  end
  it 'prefecture_idが1であれば保存できない' do
    @destination_purchase_historiy.prefecture_id = 1
    @destination_purchase_historiy.valid?
    expect(@destination_purchase_historiy.errors.full_messages).to include("Prefecture must be other than 1")
  end
  it 'municipalityが空では保存できない' do
    @destination_purchase_historiy.municipality = ''
    @destination_purchase_historiy.valid?
    expect(@destination_purchase_historiy.errors.full_messages).to include("Municipality can't be blank")
  end
  it 'addressが空では保存できない' do
    @destination_purchase_historiy.address = ''
    @destination_purchase_historiy.valid?
    expect(@destination_purchase_historiy.errors.full_messages).to include("Address can't be blank")
  end
  it 'phone_numberが空では登録できない' do
    @destination_purchase_historiy.phone_number = ''
    @destination_purchase_historiy.valid?
    expect(@destination_purchase_historiy.errors.full_messages).to include("Phone number can't be blank")
  end
  it 'phone_numberが半角の整数でなければ保存できない' do
    @destination_purchase_historiy.phone_number = '０９０１２３４５６７８'
    @destination_purchase_historiy.valid?
    expect(@destination_purchase_historiy.errors.full_messages).to include("Phone number is invalid")
  end
  it 'phone_numberが11桁以下でなければ保存できない' do
    @destination_purchase_historiy.phone_number = '111111111111'
    @destination_purchase_historiy.valid?
    expect(@destination_purchase_historiy.errors.full_messages).to include("Phone number is invalid")
  end
  it 'tokenが空では登録できない' do
    @destination_purchase_historiy.token = nil
    @destination_purchase_historiy.valid?
    expect(@destination_purchase_historiy.errors.full_messages).to include("Token can't be blank")
  end
 end
end
