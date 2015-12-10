class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.string :name
      t.decimal :total

      t.timestamps null: false
    end
  end
end
