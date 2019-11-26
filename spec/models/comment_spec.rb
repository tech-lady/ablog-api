require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'Comment Associations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:content) }
    it { should belong_to(:article) }
  end
end
