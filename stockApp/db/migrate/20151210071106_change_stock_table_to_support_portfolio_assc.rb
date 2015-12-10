class ChangeStockTableToSupportPortfolioAssc < ActiveRecord::Migration
  def change
      change_table :stocks do |t|
          t.belongs_to :portfolio, index: :true
      end
  end
end
