class Bookmark < ApplicationRecord
	belongs_to :member, optional: true
	belongs_to :log, optional: true

	validates :member_id, uniqueness: { scope: :log_id }

end
