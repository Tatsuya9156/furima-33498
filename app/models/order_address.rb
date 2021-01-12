class OrderAddress
  include ActiveModel::Model
  attr_accessor :zip, :prefecture_id, :city, :block, :building, :phone, :item_id, :user_id, :token

  with_options presence: true do
    validates :zip,           format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :block
    validates :phone, numericality: { only_integer: true }, format: { with: /\A[0-9]{,11}\z/ }
    validates :token
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)

    Address.create(zip: zip, prefecture_id: prefecture_id, city: city, block: block, building: building, phone: phone,
                   order_id: order.id)

    item = Item.find(item_id)
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: item.price,
      card: token,
      currency: 'jpy'
    )
  end
end
