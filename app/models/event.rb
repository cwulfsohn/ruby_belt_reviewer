class Event < ApplicationRecord
  belongs_to :user
  validates :name, :date, :city, :state, presence: true
  validates :name, length: {minimum: 2}
  has_many :comments, dependent: :destroy
  has_many :attendees, dependent: :destroy

end
