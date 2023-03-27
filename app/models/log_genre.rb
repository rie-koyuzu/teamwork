class LogGenre < ApplicationRecord
	has_many :log

  validates :name, presence: true, uniqueness: true

end
