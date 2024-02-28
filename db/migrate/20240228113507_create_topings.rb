class CreateTopings < ActiveRecord::Migration[7.1]
  def change
    create_table :topings do |t|
      t.string :name

      t.timestamps
    end
  end
end
