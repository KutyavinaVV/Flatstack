require 'rails_helper'

RSpec.feature 'Create List' do
  scenario 'user create list' do
    visit '/'
    click_link 'New list'
    fill_in "Title", with: 'Hello world!'
    click_button 'Create List'
    expect(page).to have_content('created')
  end
end
