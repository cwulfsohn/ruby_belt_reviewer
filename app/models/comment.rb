class Comment < ApplicationRecord
  belongs_to :event
  belongs_to :user
  validates :content, :event, :user, presence: true
  validates :content, length: {minimum: 3}
end
