require 'rails_helper'

describe "the destroy a session process" do
  before(:each) do
    user = FactoryGirl.create(:user)
  end
  it 'destroys the session!' do
    visit questions_path
    click_on 'log in'
    fill_in 'Email', :with => 'Person@gmail.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log In'
    click_on 'log out'
    expect(page).to have_content('Logged Out')
  end

  it 'rejects a user sign in' do
    visit questions_path
    click_on 'log in'
    fill_in 'Email', :with => 'Perdlfk'
    fill_in 'Password', :with => 'yomama'
    click_on 'Log In'
    expect(page).to have_content('Email or password is invalid')
  end
end
