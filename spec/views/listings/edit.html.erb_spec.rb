require 'rails_helper'

RSpec.describe "listings/edit", type: :view do
  before(:each) do
    user = assign(:user, User.create!(
      name: "bob",
      email: "email@address.com",
      password: "Password"
    ))

    @listing = assign(:listing, Listing.create!(
      title: "MyString",
      description: "MyText",
      price: "",
      sold: false,
      user: user
    ))
  end

  it "renders the edit listing form" do
    render

    assert_select "form[action=?][method=?]", listing_path(@listing), "post" do

      assert_select "input[name=?]", "listing[title]"

      assert_select "textarea[name=?]", "listing[description]"

      assert_select "input[name=?]", "listing[price]"

      assert_select "input[name=?]", "listing[sold]"
    end
  end
end
