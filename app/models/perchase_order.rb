class PerchaseOrder
  include ActiveModel::Model
  attr_accessor :zip_code, :prefecture_id, :municipality, :adress, :building_name, :phone_number, :user_id, :product_id, :token,
                :purchase_history_id

  with_options presence: true do
    validates :zip_code, :prefecture_id, :municipality, :adress, :phone_number, :token, :product_id, :user_id

    with_options numericality: { other_than: 0 } do
      validates :prefecture_id
    end
  end

  # orderの正規表現
  validates :zip_code, format: { with: /\d{3}-\d{4}/, message: 'is invalid,Input half-width numbers with hyphen' }
  with_options numericality: { only_integer: true } do
    validates :phone_number, length:{maximum: 11}, format: {with:/\A\d{1,11}\z/}
  end

  def save
    purchase_history = PurchaseHistory.create(product_id: product_id, user_id: user_id)
    Order.create(zip_code: zip_code, prefecture_id: prefecture_id, municipality: municipality, adress: adress,
                 building_name: building_name, phone_number: phone_number, purchase_history_id: purchase_history.id)
  end
end
