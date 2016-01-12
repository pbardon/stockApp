class AddStockIdToPriceTable < ActiveRecord::Migration
  def change
      change_table :stocks do |t|
          t.integer :stock_id, index: true
      end

  end
end
