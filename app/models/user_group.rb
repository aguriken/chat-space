class UserGroup < ApplicationRecord
#association
  belongs_to :user
  belongs_to :group

#validation
  validates_presence_of :user_id, :group_id
end
