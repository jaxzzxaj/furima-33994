class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string       :name,                       null: false
      t.integer      :category_id,                null: false
      t.integer      :product_condition_id,       null: false
      t.integer      :shipping_charges_id,        null: false
      t.integer      :estimated_shipping_date_id, null: false
      t.string       :prefecture_id,              null: false
      t.integer      :price,                      null: false
      t.text         :text,                       null: false
      t.integer      :genre_id,                   null: false

      t.timestamps
    end
  end
end

