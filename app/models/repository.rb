class Repository < ApplicationRecord
  validates :owner, presence: true
  validates :name, presence: true
  
end
