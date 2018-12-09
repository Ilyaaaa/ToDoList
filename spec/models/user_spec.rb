require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = User.new
    user.firstname = "first"
    user.lastname = "last"
    user.email = "test@email.com"
    user.pass = "12345678"
    user.pass_confirmation = "12345678"
    expect(user).to be_valid
  end

  it "is not valid without a first name"  do
    user = User.new
    user.lastname = "last"
    user.email = "test@email.com"
    user.pass = "12345678"
    user.pass_confirmation = "12345678"
    expect(user).to_not be_valid
  end

  it "is not valid without a last name"  do
    user = User.new
    user.firstname = "first"
    user.email = "test@email.com"
    user.pass = "12345678"
    user.pass_confirmation = "12345678"
    expect(user).to_not be_valid
  end

  it "is not valid without a email"  do
    user = User.new
    user.firstname = "first"
    user.lastname = "last"
    user.pass = "12345678"
    user.pass_confirmation = "12345678"
    expect(user).to_not be_valid
  end

  it "is not valid without a pass"  do
    user = User.new
    user.firstname = "first"
    user.lastname = "last"
    user.email = "test@email.com"
    expect(user).to_not be_valid
  end
end
