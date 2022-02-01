class Like < ApplicationRecord
  belongs_to :bakerscombination
  belongs_to :user

  validates_uniqueness_of :bakerscombination_id, scope: :user_id
end
