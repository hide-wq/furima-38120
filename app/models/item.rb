class Item < ApplicationRecord
  
  with_options presence: true do
    validates :name
    validates :description
    validates :price, numericality:{in: 300..9999999}
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :sales_status_id
      validates :delivery_load_id
      validates :delivery_day_id
      validates :prefecture_id
      validates :shipping_fee_status_id
    end
    validates :image
  end

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :sales_status
  belongs_to :scheduled_derivery
  belongs_to :shipping_fee_status
  has_one_attached :image

  private

   def message_params
     params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
   end
end
