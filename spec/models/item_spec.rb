require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.create(:item)
  end

  describe '商品の出品登録' do
    context '出品登録ができるとき' do
      it '全ての入力事項が、存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'カテゴリーが「---」以外であれば登録できる' do
        @item.category_id = 1
        expect(@item).to be_valid
      end
      it '商品の状態が「---」以外であれば登録できる' do
        @item.sales_status_id = 1
        expect(@item).to be_valid
      end
      it '配送料の負担が「---」以外であれば登録できる' do
        @item.shipping_fee_status_id = 1
        expect(@item).to be_valid
      end
      it '発送元の地域が「---」以外であれば登録できる' do
        @item.prefecture_id = 1
        expect(@item).to be_valid
      end
      it '発送までの日数が「---」以外であれば登録できる' do
        @item.scheduled_delivery_id = 1
        expect(@item).to be_valid
      end
    end

    context '出品ができないとき' do
      it '１枚画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空欄だと出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空欄だと出品できない' do
        @item.info = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'カテゴリーの情報が「---」だと出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 0')
      end
      it 'カテゴリーの情報が空欄だと出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態の情報が「---」だと出品できない' do
        @item.sales_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Sales status must be other than 0')
      end
      it '商品の状態の情報が空欄だと出品できない' do
        @item.sales_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status can't be blank")
      end
      it '配送料の負担の情報が「---」だと出品できない' do
        @item.shipping_fee_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee status must be other than 0')
      end
      it '配送料の負担の情報が空欄だと出品できない' do
        @item.shipping_fee_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
      end
      it '発送元の地域の情報が「---」だと出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it '発送元の地域の情報が空欄だと出品できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数の情報が「---」だと出品できない' do
        @item.scheduled_delivery_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Scheduled delivery must be other than 0')
      end
      it '発送までの日数の情報が空欄だと出品できない' do
        @item.scheduled_delivery_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
      end
      it '価格が空欄だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number')
      end
      
    end
  end
end
