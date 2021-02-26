require 'rails_helper'

RSpec.feature 'Create List' do
  scenario 'user create list' do
    visit '/'
    click_link 'New list'
    fill_in "Title", with: 'Hello world!'
    click_button 'Create List'
    expect(page).to have_content('created')
  end

  scenario 'user create and update list' do
    visit '/'
    click_link 'New list'
    fill_in "Title", with: 'Hello world!'
    click_button 'Create List'
    click_link 'Edit'
    fill_in "Title", with: 'New world!'
    click_button 'Update List'
    expect(page).to have_content('updated')
  end
end
