require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
      puts "\n================================"

  end


  test "should have proper fields and save to database" do
      username = users(:jim).name
      puts "Starting test with user: #{username}"
      user = User.new({ name: username, funds: 10000.00 })
      puts "About to create user: #{user.to_s}\n"
      assert user.save
      puts "User created"
  end

  test "should be able to find user by username" do
      puts "Starting find_by_username test...\n"
      username = users(:jim).name
      user = User.find_by_username(username)
      puts "User found: #{user.to_s}"
      assert user.funds == 10000.00
  end


end
