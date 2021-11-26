require 'rails_helper'

RSpec.describe Deal, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(20) }
    it { should validate_presence_of(:quantity) }
    it { should validate_numericality_of(:quantity).is_greater_than(0) }
    it { should validate_numericality_of(:quantity).only_integer }
  end
end
