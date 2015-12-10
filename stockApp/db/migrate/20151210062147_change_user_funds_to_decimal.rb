class ChangeUserFundsToDecimal < ActiveRecord::Migration
  def change
      reversible do |dir|
          change_table :users do |t|
              dir.up   { t.change :funds, :decimal }
              dir.down { t.change :funds, :integer }
          end
     end
  end
end
