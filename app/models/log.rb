class Log < ApplicationRecord
	belongs_to :member, optional: true
	belongs_to :log_genre
	has_many :likes, dependent: :destroy
	has_many :bookmarks, dependent: :destroy

    def liked_by?(member)
      likes.where(member_id: member.id).exists?
    end

    def bookmarked_by?(member)
      bookmarks.where(member_id: member).exists?
    end

    def self.search(keyword)
      where(["title like? OR body like? OR log_genre_id like?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
    end

end
