require 'rails_helper'

describe "the user log in process" do
  it "logs in a user" do
    visit questions_path
    click_link 'sign up'
    fill_in 'Email', :with => 'Person@gmail.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_on 'Create User'
    click_on 'log out'
    click_on 'log in'
    fill_in 'Email', :with => 'Person@gmail.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log In'
    expect(page).to have_content 'Logged in as Person@gmail.com'
  end
end
