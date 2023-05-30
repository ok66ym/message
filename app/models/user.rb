class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end

  has_many :comments, dependent: :destroy
  
  has_many :room_participants, dependent: :destroy
  has_many :rooms, through: :room_participants, source: :room, dependent: :destroy

  has_many :responses, dependent: :destroy

  validates :name, presence: :true, uniqueness: :true
  

  # validates :university, presence: { message: "大学名を入力してください" }, length: { maximum: 100}
  # validates :undergraduate, presence: { message: "学部を入力してください" }, length: { maximum: 100 }
  # validates :department,  length: { maximum: 100 }, allow_blank: true
  # validates :name, uniqueness: { scope: :user }, presence: { message: "名前を入力してください" }
  # #emailは? #初期値匿名？

end
