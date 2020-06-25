class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :invites
  has_many :attendees, through: :invites, source: :user
  scope :upcoming, -> { where('event_date > ?', Time.now) }
  scope :past, -> { where('event_date < ?', Time.now) }
  validates :location, presence: true
  validates :event_date, presence: true
  validates :creator_id, presence: true
end
