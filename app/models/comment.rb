class Comment < ApplicationRecord
  belongs_to :article, foreign_key: :article_id
  validate_the_presence_of :name, :content
end
