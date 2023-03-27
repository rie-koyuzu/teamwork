class TrainingComment < ApplicationRecord
	belongs_to :member
	belongs_to :training

	validates :progress, presence: true
	validates :comment, presence: true

end
