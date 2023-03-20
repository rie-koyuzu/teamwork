class Log < ApplicationRecord
	belongs_to :member, optional: true
	belongs_to :log_genre, dependent: :destroy
	has_many :good, dependent: :destroy

end
