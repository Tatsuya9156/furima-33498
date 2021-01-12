require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @order_address = FactoryBot.build(:order_address, item_id: item.id, user_id: user.id)
    sleep(1)
  end

  describe '商品購入' do
    context '商品購入ができるとき' do
      it 'token、zip、prefecture_id、city、block、building、phoneが存在すれば購入できる' do
        expect(@order_address).to be_valid
      end
      it 'buildingが空でも購入できる' do
        @order_address.building = nil
        expect(@order_address).to be_valid
      end
    end

    context '商品購入ができないとき' do
      it 'tokenが空では購入できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'zipが空では購入できない' do
        @order_address.zip = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip can't be blank")
      end
      it 'zipが半角数字3桁-4桁でないと購入できない' do
        @order_address.zip = '1234-567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Zip is invalid')
      end
      it 'zipがハイフンなしでは購入できない' do
        @order_address.zip = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Zip is invalid')
      end
      it 'prefecture_idが空では登録できない' do
        @order_address.prefecture_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture is not a number')
      end
      it 'prefecture_idが1(---)では登録できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'cityが空では購入できない' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空では購入できない' do
        @order_address.block = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'phoneが空では購入できない' do
        @order_address.phone = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneが半角数字11桁以内でないと購入できない' do
        @order_address.phone = 123_456_789_012
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is invalid')
      end
      it 'phoneは数字のみでないと購入できない' do
        @order_address.phone = 'abcde12345'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is invalid')
      end
      it 'item_idが空では購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_idが空では購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
