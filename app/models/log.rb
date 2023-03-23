class Log < ApplicationRecord
	belongs_to :member, optional: true
	belongs_to :log_genre, dependent: :destroy
	has_many :likes, dependent: :destroy

    def liked_by?(member)
      likes.where(member_id: member.id).exists?
    end

end
