require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user should enter a first name" do |  |
  	user = User.new
  	assert !user.save #we WANT to make sure that the user isn't saved if there is no first name
  	assert !user.errors[:first_name].empty? #we WANT to amke sure that there are errors if there is no first name
  end

  test "a user should enter a last name" do |  |
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end

  test "a user should enter a profile name" do |  |
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a unique profile name" do |  |
  	user = User.new
  	user.profile_name = users(:jason).profile_name
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a profile name without spaces" do |  |
  	user = User.new
  	user.profile_name = 'My profile name with spaces'
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  	assert user.errors[:profile_name].include?("Must be formatted correctly.")
  end
end
