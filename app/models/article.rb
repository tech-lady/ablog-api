class Article < ApplicationRecord

  has_many :comments, dependent: :destroy

  validates_the_presence_of :title, :author
end
