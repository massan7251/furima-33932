require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
  end
  describe '商品登録' do
   context '商品登録できる時' do
    it 'image,name,description,price,category,status,burden,prefecture,shipmentがあれば登録できる' do
      @user
      expect(@item).to be_valid
    end
    it 'descriptionが40文字以下であれば登録できる' do
      @item.description = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
      expect(@item).to be_valid
    end
    it 'priceが300以上であれば登録できる' do
      @item.price = '300'
      expect(@item).to be_valid
    end
    it 'priceが9999999以下であれば登録できる' do
      @item.price = '9999999'
      expect(@item).to be_valid
    end
    it 'priceが半角数字であれば登録できる' do
      @item.price = '5555555'
      expect(@item).to be_valid
    end
   end
   context '商品登録できない時' do
    it 'imageがなければ登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'nameがなければ登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'descriptionがなければ登録できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'priceがなければ登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'category_idが1であれば登録できない' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it 'status_idが1であれば登録できない' do
      @item.status_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end
    it 'burden_idが1であれば登録できない' do
      @item.burden_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Burden must be other than 1")
    end
    it 'prefecture_idが1であれば登録できない' do
      @item.prefecture_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it 'shipment_idが1であれば登録できない' do
      @item.shipment_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipment must be other than 1")
    end
    it 'descriptionがあっても40文字以上では登録できない' do
      @item.description = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include("Description is too long (maximum is 40 characters)")
    end
    it 'priceがあっても300以下では登録できない' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it 'priceがあっても9999999以上では登録できない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
    it 'priceが全角数字であれば登録できない' do
      @item.price = '１２３４５'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it 'priceが文字列であれば登録できない' do
      @item.price = 'text'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
   end
  end
end
