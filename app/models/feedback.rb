class Feedback < ApplicationRecord
	belongs_to :trainings, optional:true

end
