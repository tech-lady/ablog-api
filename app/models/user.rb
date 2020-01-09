class User < ApplicationRecord
  has_secure_password
  has_many :articles, dependent: :destroy
  validates :email,
            presence: true,
            format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password,
            length: { minimum: 5 }
  validates_uniqueness_of :email, case_sensitive: true
  validates_presence_of :name, :email, :password
end
