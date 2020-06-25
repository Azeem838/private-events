require 'rails_helper'

feature 'sign up process' do
  scenario 'has a new user sign up page' do
    visit new_user_registration_path
  end
end
