class Item < ApplicationRecord
  
  with_options presence: true do
    validates :name
    validates :description
    validates :price, numericality:{in: 300..9999999}
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :delivery_load_id
      validates :delivery_day_id
      validates :prefecture_id
    end
  end

  belongs_to :user

end
