require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'Articles Associations and Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:author) }
    it { should have_many(:comments) }
  end
end
