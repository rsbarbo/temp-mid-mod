class User < ApplicationRecord
  has_many :links
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
                              on: :create },
                              uniqueness: true
  has_secure_password
end
