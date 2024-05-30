require 'rails_helper'

RSpec.describe 'Login Page', type: :feature do
  let(:user) { create(:user) }

  it "Admin requires loggin in" do
    login_as user

    click_link 'Logout'

    expect(page).to have_link 'My Blog'
  end
end
