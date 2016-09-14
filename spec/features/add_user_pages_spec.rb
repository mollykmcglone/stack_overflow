require 'rails_helper'

describe "the add a user process" do
  it "creates a new user" do
    visit questions_path
    click_link 'sign up'
    fill_in 'Email', :with => 'Person@gmail.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_on 'Create User'
    expect(page).to have_content 'Logged in as Person@gmail.com'
  end

  it "won't create a new user without matching password and password_confirmation fields" do
    visit questions_path
    click_link 'sign up'
    fill_in 'Email', :with => 'Person@gmail.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password1'
    click_on 'Create User'
    expect(page).to have_content 'Form is invalid'
  end
end
