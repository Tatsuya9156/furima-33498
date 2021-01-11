class OrderAddress
  include ActiveModel::Model
  attr_accessor :zip, :prefecture_id, :city, :block, :building, :phone, :item_id, :user_id

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(zip: zip, prefecture_id: prefecture_id, city: city, block: block, building: building, phone: phone, order_id: order.id)
  end
end