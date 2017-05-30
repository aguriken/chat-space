class UserGroup < ApplicationRecord
#association
  belongs_to :user
  belongs_to :group
end
