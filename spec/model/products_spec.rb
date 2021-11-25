require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:deals) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(20) }
  end
end