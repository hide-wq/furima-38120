class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id, numericality: { other_than: 0}
    validates :city
    validates :addresses
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/}
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Payment.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number)
  end
end