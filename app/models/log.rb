class Log < ApplicationRecord
	belongs_to :member, optional: true
	belongs_to :log_genre, dependent: :destroy
	has_many :goods, dependent: :destroy

	def favorited_by?(member)
    goods.exists?(member_id: member.id)
  end

end
