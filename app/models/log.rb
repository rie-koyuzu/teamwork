class Log < ApplicationRecord
	belongs_to :member, optional: true
	belongs_to :log_genre
	has_many :likes, dependent: :destroy
	has_many :bookmarks, dependent: :destroy

    def liked_by?(member)
      likes.where(member_id: member.id).exists?
    end

    def self.search(keyword)
      joins(:log_genre).where(["title like? OR log_genres.name like?", "%#{keyword}%", "%#{keyword}%"])
    end

    def bookmarked_by?(member)
      bookmarks.where(member_id: member).exists?
    end

end
