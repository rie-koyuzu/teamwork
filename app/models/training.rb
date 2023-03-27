class Training < ApplicationRecord
	belongs_to :member, optional:true
	belongs_to :training_genre, optional:true
	has_many :training_comments, dependent: :destroy
	has_many :feedbacks, dependent: :destroy

	validates :title, presence: true
	validates :time, presence: true
	validates :introductio, presence: true
	validates :training_genre_id, presence: true


end
