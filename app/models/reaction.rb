class Reaction < ApplicationRecord
  belongs_to :adventure, optional: true
  belongs_to :user
  belongs_to :comment, optional: true  
end