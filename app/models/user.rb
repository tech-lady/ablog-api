class User < ApplicationRecord
  has_secure_password
  has_many :articles, dependent: :destroy
  validates :password,
            length: { minimum: 5 }
  validates_uniqueness_of :email,
                          case_sensitive: true,
                          format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_presence_of :name, :email, :password
end
