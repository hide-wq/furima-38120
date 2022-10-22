class Item < ApplicationRecord
  
  with_options presence: true do
    validates :user_id
    validates :name
    validates :info
    validates :price, numericality:{only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
    validates :image
    validates :category_id
    validates :sales_status_id
    validates :scheduled_delivery_id
    validates :prefecture_id
    validates :shipping_fee_status_id
  end

  with_options numericality: { other_than: 0 } do
  validates :category_id
  validates :sales_status_id
  validates :scheduled_delivery_id
  validates :prefecture_id
  validates :shipping_fee_status_id
  end

  belongs_to :user


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :sales_status
  belongs_to :scheduled_delivery
  belongs_to :shipping_fee_status
  has_one_attached :image

end
