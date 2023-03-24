class Log < ApplicationRecord
	belongs_to :member, optional: true
	belongs_to :log_genre, dependent: :destroy
	has_many :likes, dependent: :destroy

    def liked_by?(member)
      likes.exists?(member_id: member.id)
    end

    def self.search(keyword)
      where(["title like? OR body like? OR log_genre_id like?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
    end

end
