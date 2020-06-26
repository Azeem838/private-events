require 'rails_helper'

feature 'create an event' do
  scenario 'has a new event page' do
    visit new_event_path
    expect(page).to have_content 'New event page'
  end

  feature 'add a new event with valid params' do
    before(:each) do
      @user = User.create!(username: 'test', email: 'test@example.com', password: 'password')
      sign_in @user
      visit new_event_path
      fill_in 'Location', with: 'testing_location'
      fill_in 'Event date', with: DateTime.now
      click_on 'Create'
    end

    scenario 'redirects to root path after new event' do
      expect(page).to have_content 'Upcoming Events'
    end
  end

  feature 'add a new event with invalid params' do
    before(:each) do
      @user = User.create!(username: 'test', email: 'test@example.com', password: 'password')
      sign_in @user
      visit new_event_path
      fill_in 'Location', with: 'testing_location'
      click_on 'Create'
    end

    scenario 'renders new path with invalid params' do
      expect(page).to have_content 'New event page'
    end
  end
end

feature 'attend an event' do
  before(:each) do
    user = User.create!(username: 'testme', email: 'test@example.com', password: 'f4k3p455w0rd')
    Event.create!(location: 'Somewhere', event_date: DateTime.now, creator_id: user.id)
    @user1 = User.create!(username: 'testme1', email: 'test1@example.com', password: 'f4k3p455w0rd')
    sign_in @user1
    visit root_path
  end

  scenario 'clicking attend' do
    click_on 'Attend'
    visit user_path(@user1.id)
    expect(page).to have_content 'Somewhere'
  end
end
