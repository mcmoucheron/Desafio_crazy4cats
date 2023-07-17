class Comment < ApplicationRecord
  belongs_to :adventure
  belongs_to :user
  has_many :reactions, dependent: :destroy
end
