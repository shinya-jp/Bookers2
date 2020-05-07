class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 attachment :profile_image
 has_many :books, dependent: :destroy
 has_many :book_comments, dependent: :destroy
 has_many :favorites, dependent: :destroy
 has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
 has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
 has_many :following, through: :active_relationships, source: :followed
 has_many :followers, through: :passive_relationships, source: :follower
 # ユーザーをフォローする
  def follow(other_user)
    active_relationships.create(followed_id: other_user)
  end

  # ユーザーをアンフォローする
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end
# 検索機能
  def User.search(search, user_or_book, how_search)
    if user_or_book == "user"
      if how_search == "partical"
        User.where(['name LIKE ?', "%#{search}%"])
      elsif how_search == "backward"
        User.where(['name LIKE ?', "%#{search}"])
      elsif how_search == "forward"
        User.where(['name LIKE ?', "#{search}%"])
      elsif how_search == "match"
        User.where(['name LIKE ?', "#{search}"])
      else
        User.all
       end
    end
  end
#バリデーション
 validates :name, presence: true, length: {in: 2..20}
 validates :introduction, length:{ maximum: 50}
end