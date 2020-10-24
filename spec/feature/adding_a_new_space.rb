require 'spec_helper'


feature 'Can add a new space ' do
  scenario 'A user can add a new space ' do
    visit('/')
    fill_in('email', with: 'test2@test.com')
    fill_in('password', with: 'test212')
    click_button('submit')
    click_link('Add new space')
    fill_in('name',with: 'Kastelorizo')
    fill_in('description',with: 'A cosy space 2 bedroom flat')
    fill_in('price',with: '50')
    click_button('List it!')
    expect(page.current_path).to eq('/')
    expect(page).to have_content('Kastelorizo')
    expect(page).to have_content('A cosy space 2 bedroom flat')
    expect(page).to have_content('50')
  end
end
