require 'rails_helper'

describe "the add question feature" do
  it "creates a new question" do
    user = FactoryGirl.create(:user)
    visit questions_path
    click_on 'log in'
    fill_in 'Email', :with => 'Person@gmail.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log In'
    visit questions_path
    click_link 'Ask a new question'
    fill_in 'Title', :with => 'This is a question'
    fill_in 'Content', :with => 'A very very important question here...'
    click_on 'Create Question'
    expect(page).to have_content 'This is a question'
  end
end
