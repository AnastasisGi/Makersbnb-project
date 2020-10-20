require 'spec_helper'

feature 'Registrations' do
  scenario 'user can sign up and be signed in' do
    visit('registrations/new')
    puts page.body
    fill_in('email',with:'test@test.com')
    fill_in('password',with:'test12')
    click_button 'submit'
    expect(page.current_path).to eq ('/')
    expect(page).to have_content('Hi test@test.com ')
  end
end
