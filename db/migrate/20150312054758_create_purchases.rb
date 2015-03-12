class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|

      t.timestamps null: false
    end
  end
end
