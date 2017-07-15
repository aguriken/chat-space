class Message < ApplicationRecord
# association
  belongs_to :group
  belongs_to :user

# validation
  validates_presence_of :body, :user_id, :group_id
  mount_uploader :image, ImageUploader
end
