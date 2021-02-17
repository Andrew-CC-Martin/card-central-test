require 'rails_helper'

RSpec.describe "listings/show", type: :view do
  before(:each) do
    user = assign(:user, User.create!(
      name: "bob",
      email: "email@address.com",
      password: "Password"
    ))

    @listing = assign(:listing, Listing.create!(
      title: "Title",
      description: "MyText",
      price: "",
      sold: false,
      user: user
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
  end
end
