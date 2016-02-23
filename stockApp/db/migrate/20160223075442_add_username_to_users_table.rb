class AddUsernameToUsersTable < ActiveRecord::Migration
  def change
      change_table :users do |t|
          t.string :username, index: true
      end
  end
end
