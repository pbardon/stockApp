class AddUserPortfolioAssociation < ActiveRecord::Migration
  def change
      change_table :portfolios do |t|
          t.belongs_to :user, index: true
          t.datetime :start_date
      end
  end
end
