class Like < ApplicationRecord
	belongs_to :log, optional: true
	belongs_to :member, optional: true

end
