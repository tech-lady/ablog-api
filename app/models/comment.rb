class Comment < ApplicationRecord
  belongs_to :article, foreign_key true
  validate_the_presence_of :name
end
