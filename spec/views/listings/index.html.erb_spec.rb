require 'rails_helper'

RSpec.describe "listings/index", type: :view do
  before(:each) do
    user = assign(:user, User.create!(
      name: "bob",
      email: "email@address.com",
      password: "Password"
    ))
    assign(:listings, [
      Listing.create!(
        title: "Title",
        description: "MyText",
        price: "",
        sold: false,
        user: user
      ),
      Listing.create!(
        title: "Title",
        description: "MyText",
        price: "",
        sold: false,
        user: user
      )
    ])
  end

  it "renders a list of listings" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
