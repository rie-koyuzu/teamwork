class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_one_attached :profile_image

         has_many :logs, dependent: :nullify
         has_many :likes, dependent: :destroy
         has_many :trainings, dependent: :destroy
         has_many :bookmarks, dependent: :destroy
         has_many :training_comments, dependent: :destroy

         validates :last_name,  presence: true
         validates :first_name, presence: true
         validates :last_name_eng,  presence: true
         validates :first_name_eng, presence: true
         validates :employee_number, presence: true
         validates :affiliation, presence: true

    def self.search(keyword)
      where(["last_name like? OR first_name like? OR employee_number like?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
    end

end
