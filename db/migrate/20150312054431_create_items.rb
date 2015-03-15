class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :product_id
      t.string :image_url
      t.decimal :price
      t.decimal :quantity
      t.boolean :purchased
      t.belongs_to :user
      t.belongs_to :purchase

      t.timestamps null: false
    end
  end
end
