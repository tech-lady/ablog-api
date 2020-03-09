class Article < ApplicationRecord

  has_many :comments, dependent: :destroy
  belongs_to :user

  validates_presence_of :title, :author, :content
end
