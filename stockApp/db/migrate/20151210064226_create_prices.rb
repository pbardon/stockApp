class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
        t.date :date
        t.decimal :open
        t.decimal :close
        t.integer :volume
        t.belongs_to :stock, index: true

        t.timestamps null: false
    end
  end
end
