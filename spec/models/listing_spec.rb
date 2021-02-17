require 'rails_helper'

RSpec.describe Listing, type: :model do
  before(:each) do
    @user = User.create!(
      name: "bob",
      email: "email@address.com",
      password: "Password"
    )
  end

  it "allows creation of listings" do
    listing = Listing.create!(
      title: "MyString",
      description: "MyText",
      price: 5,
      sold: false,
      user: @user
    )
    expect(listing.price).to be(5)
  end

  it "requires title" do
    listing = Listing.new(
      title: nil,
      description: "MyText",
      price: 5,
      sold: false,
      user: @user
    )

    expect(listing.valid?).to be(false)
  end
end
