class Event < ApplicationRecord
	belongs_to :creator, class_name: :User
    has_many :invitations,foreign_key: :attended_event_id
    has_many :attendees, through: :invitations , source: :attendee
    
    default_scope { order("created_at DESC") }
    scope :upcoming_events, -> {where("date >= ?",DateTime.now)}
    scope :prev_events, -> {where("date < ?",DateTime.now)}
end
