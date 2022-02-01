class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  has_many :comments, dependent: :destroy
end
