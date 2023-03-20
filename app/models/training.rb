class Training < ApplicationRecord
	belongs_to :member, optional:true
	has_many :training_genre, dependent: :destroy

end
