class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true #追記

  has_many :bakerscombinations, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_bakerscombinations, through: :likes, source: :bakerscombination
  has_many :comments, dependent: :destroy
  has_many :reviews, dependent: :destroy

  def already_liked?(bakerscombination)
    self.likes.exists?(bakerscombination_id: bakerscombination.id)
  end
  
end
