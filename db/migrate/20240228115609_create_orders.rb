class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.boolean :completed
      t.string :promotion_code
      t.string :discount_code
      t.references :items, null: false, foreign_key: true

      t.timestamps
    end
  end
end
