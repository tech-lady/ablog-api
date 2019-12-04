require 'rails_helper'
RSpec.describe User, 'Validations', type: :model do
  let(:user) { create(:user) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
end

RSpec.describe User, 'Associations', type: :model do
  it { should have_many(:articles) }
end
