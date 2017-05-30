class Group < ApplicationRecord
#association
  has_many :user_groups
  has_many :users, through: :user_groups
end
