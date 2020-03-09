require 'rails_helper'

RSpec.describe Comment, 'Validations', type: :model do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:content) }
end

RSpec.describe Comment, 'Associations', type: :model do
  it { should belong_to(:article) }
end
