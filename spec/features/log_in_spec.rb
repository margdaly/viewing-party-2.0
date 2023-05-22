require 'rails_helper'

RSpec.describe 'Logging In' do
  scenario 'happy path' do
    user = User.create(name: 'Tammy', email: 'funbucket13@email.com', password: 'test', password_confirmation: 'test')

    visit root_path

    click_on 'I already have an account'

    expect(current_path).to eq(login_path)

    fill_in :email, with: user.email
    fill_in :password, with: user.password

    click_on 'Log In'

    expect(current_path).to eq("/users/#{user.id}")
  end

  scenario 'sad path, incorrect credentials' do
    user = User.create(name: 'Tammy', email: 'funbucket13@email.com', password: 'test', password_confirmation: 'test')

    visit login_path

    fill_in :email, with: user.email
    fill_in :password, with: "incorrect password"
  
    click_on "Log In"
  
    expect(current_path).to eq(login_path)
  
    expect(page).to have_content("Sorry, your credentials are incorrect.")
  end
end