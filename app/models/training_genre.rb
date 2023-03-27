class TrainingGenre < ApplicationRecord
	has_many :training

	validates :menu, presence: true

end
