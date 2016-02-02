class AddExchangeToStockInfo < ActiveRecord::Migration
  def change
      change_table :stocks do |t|
          t.string :exchange
      end
  end
end
