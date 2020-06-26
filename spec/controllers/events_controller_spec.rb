require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'GET #new' do
    it 'renders the new event page' do
      get :new
      expect(response).to render_template('new')
      expect(response).to have_http_status(200)
    end
  end
  context 'with invalid params' do
    it 'validates the presence of location and event_date' do
      @user = User.create!(username: 'test', email: 'test@example.com', password: 'password')
      sign_in @user
      post :create, params: { event: { location: 'this is an invalid location' } }
      expect(response).to render_template('new')
      expect(flash[:alert]).to be_present
    end
  end

  context 'with valid params' do
    it 'redirects to the event show page' do
      @user = User.create!(username: 'test', email: 'test@example.com', password: 'password')
      sign_in @user
      post :create, params: { event: { location: 'teehee', event_date: DateTime.now } }
      expect(response).to redirect_to(root_path)
    end
  end
end
