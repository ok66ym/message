class Room < ApplicationRecord
  has_many :room_participants, dependent: :destroy
  has_many :users, through: :room_participants, source: :user
  has_many :responses, dependent: :destroy

  #バリデーション空白NG、同一データ１つのみ
  validates :roomname, presence: :true, uniqueness: :true
end
