require 'rails_helper'

describe "the edit question feature" do
  before(:each) do
    question = FactoryGirl.create(:question)
    visit questions_path
    click_on 'log in'
    fill_in 'Email', :with => 'Person@gmail.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log In'
  end

  it 'allows user to edit a question' do
    click_on 'How are you?'
    click_on 'Edit Question'
    fill_in 'Title', :with => 'How is your mother?'
    fill_in 'Content', :with => 'I do not care!'
    click_on 'Update Question'
    expect(page).to have_content 'How is your mother?'
  end

  it 'allows user to delete a question' do
    click_on 'How are you?'
    click_on 'Delete Question'
    expect(page).to_not have_content 'How are you?'
  end

  it "won't update a question without a title" do
    click_on 'How are you?'
    click_on 'Edit Question'
    fill_in 'Title', :with => ''
    fill_in 'Content', :with => 'A very very important question here...'
    click_on 'Update Question'
    expect(page).to have_content 'Form is invalid'
  end

end
