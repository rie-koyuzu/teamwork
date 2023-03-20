class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :log, dependent: :nullify
         has_many :good, dependent: :destroy
         has_many :training, dependent: :destroy
         has_many :bookmark, dependent: :destroy

       validates :last_name,  presence: true
       validates :first_name, presence: true
       validates :last_name_eng,  presence: true
       validates :first_name_eng, presence: true
       validates :employee_number, presence: true
       validates :affiliation, presence: true

end
