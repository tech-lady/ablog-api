class Article < ApplicationRecord

  has_many :comments, dependent: :destroy
  belongs_to :user, foreign_key: true

  validates_presence_of :title, :author
end
