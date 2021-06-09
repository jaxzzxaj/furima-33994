class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string              :zip_code,                null: false
      t.integer             :prefecture_id,           null: false
      t.string              :municipality,            null: false
      t.string              :adress,                  null: false
      t.string              :building_name
      t.string              :phone_number,            null: false
      t.references          :purchase_history,        foreign_key: true

      t.timestamps
    end
  end
end
