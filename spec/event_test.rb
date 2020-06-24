# require 'test_helper'
require 'spec_helper'
# require 'rails_helper'

class EventTest < ActiveSupport::TestCase
  RSpec.describe Event, :type => :model do
	  subject {
	    described_class.new(location: "Anything",
	                        event_date: DateTime.now,
	                        creator_id: 1
	                        )
	  }

	  it "is valid with valid attributes" do
	    expect(subject).to be_valid
	  end

	  it "is not valid without a location" do
	    subject.location = nil
	    expect(subject).to_not be_valid
	  end

	  it "is not valid without an event_date" do
	    subject.event_date = nil
	    expect(subject).to_not be_valid
	  end

	  it "is not valid without a creator_id" do
	    subject.creator_id = nil
	    expect(subject).to_not be_valid
	  end
	end
end
