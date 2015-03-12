require 'rails_helper'

describe "Adding an item to my shopping list" do
  let(:email) { 'neo@matr.ix' }
  let(:password) { 'swordfish' }

  def login
    visit '/'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log in'
  end

  before do
    User.create!(
      :email => email,
      :password => password,
      :password_confirmation => password
    )

    login
  end

  it 'does a thing' do
    fill_in 'Search', with: 'Butter'
    click_button 'Add to list'
    expect(User.last.items_in_shopping_list.size).to eq 1
  end
end
