class Bookmark < ApplicationRecord
	belongs_to :good, optional: true
	belongs_to :member, optional: true

end
