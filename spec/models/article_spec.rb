require 'rails_helper'

RSpec.describe Article, 'Validations', type: :model do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:author) }
end

RSpec.describe Article, 'Associations', type: :model do
  it { should have_many(:comments).dependent(:destroy) }
end