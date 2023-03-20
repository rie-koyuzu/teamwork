class Training < ApplicationRecord
	belongs_to :member, optional:true
	belongs_to :training_genre, optional:true

end
