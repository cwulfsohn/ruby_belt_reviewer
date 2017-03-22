class User < ApplicationRecord
  has_secure_password
  validates :first_name, :last_name, :city, :state, :email, presence: true
  validates :first_name, :last_name, length: {minimum: 3}
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, format: { with: EMAIL_REGEX}, uniqueness: true
  validates :password, confirmation: true
  validates :password, length: {minimum: 7}, on: :create

  has_many :events
  has_many :comments
  has_many :attending, through: :attendees, source: :event

end
