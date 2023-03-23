class Bookmark < ApplicationRecord
	belongs_to :like, optional: true
	belongs_to :member, optional: true

end
