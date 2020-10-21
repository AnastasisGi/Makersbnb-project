require 'spec_helper'

feature 'Sessions' do

before  do
  user=User.new(email: 'test@test.com')
  user.password = 'test12'
  user.save!

end

  scenario 'user can sign in' do
    visit('/sign_in')
    # puts page.body
    fill_in('email', with:'test@test.com')
    fill_in('password',with:'test12')
    click_button ('submit')
    # puts page.body
    expect(page.current_path).to eq ('/')
    expect(page).to have_content('Hi, test@test.com')

  end

  scenario 'wrong email and user can not sign in' do
    visit('/sign_in')
    fill_in('email', with:'incorrect@test.com')
    fill_in('password',with:'test12')
    click_button ('submit')
    expect(page.current_path).to eq ('/sign_in')
  end

  scenario 'wrong password user can not sign in' do
    visit('/sign_in')
    fill_in('email', with:'test@test.com')
    fill_in('password',with:'incorrect')
    click_button ('submit')
    expect(page.current_path).to eq ('/sign_in')
  end


  scenario  'user redirected if not signed in ' do
    visit('/')
    expect(page.current_path).to eq ('/sign_in')
  end


  scenario 'User can sign out' do
    visit('/sign_in')
    # puts page.body
    fill_in('email', with:'test@test.com')
    fill_in('password',with:'test12')
    click_button ('submit')

    click_button ('sign out')
    visit('/')
    expect(page.current_path).to eq('/sign_in')
  end














end
