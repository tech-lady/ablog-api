class User < ApplicationRecord
  has_secure_password
  has_many :articles
  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password,
            length: { minimum: 5 }
  validates_presence_of :name, :email, :password
end
