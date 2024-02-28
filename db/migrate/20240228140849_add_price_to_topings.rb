class AddPriceToTopings < ActiveRecord::Migration[7.1]
  def change
    add_column :topings, :price, :integer
  end
end
