class User < ApplicationRecord
	# ----- add these lines here: -----
	
	has_secure_password

	# Verify that email field is not blank and that it doesn't already exist in the db (prevents duplicates):
	validates :email, presence: true, uniqueness: true
	has_many :events, foreign_key: :creator_id
	has_many :invitations, foreign_key: :attendee_id
    has_many :attended_events,through: :invitations , source: :attended_event

	# ----- end of added lines -----
end
