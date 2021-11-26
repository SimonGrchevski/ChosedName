require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'Gandalf', email: 'Gandy4@email.com', password: 'GandyAlmighty') }

  before { user.save }

  describe 'assocciations' do
    it { should have_many(:deals) }
    it { should have_many(:products) }
  end

  describe 'validations' do
    context 'with correct parameters' do
      it 'name, email, password should be present' do
        expect(user).to be_valid
      end
    end

    context 'invalid  parameters' do
      it 'name must be present' do
        user.name = nil
        expect(user).to_not be_valid
      end
    end

    it 'email must be present' do
      user.email = nil
      expect(user).to_not be_valid
    end

    it 'password must be present' do
      user.password = nil
      expect(user).to_not be_valid
    end

    it 'name length  must not be too long' do
      user.name = 'Gandalf' * 20
      expect(user).to_not be_valid
    end

    it 'password must not extend the defined length' do
      user.password = 'myWhiteCloak' * 10
      expect(user).to_not be_valid
    end
  end
end
