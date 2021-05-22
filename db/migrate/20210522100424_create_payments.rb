class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.float :amount
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
