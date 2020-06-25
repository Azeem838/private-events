require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    it 'should validate presence of location' do
      user = User.create!(username: 'test', email: 'test@example.com', password: 'password')
      event = Event.new(location: 'Somewhere', event_date: DateTime.now, creator_id: 1)
      expect(event.valid?).to be true
    end

    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:event_date) }
    it { should validate_presence_of(:creator_id) }
  end

  describe 'associations' do
    it { should have_many(:attendees) }
    it { should have_many(:invites) }
    it { should belong_to(:creator) }
  end
end
