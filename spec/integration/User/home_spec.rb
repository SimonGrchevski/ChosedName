require 'rails_helper'

RSpec.describe 'User view', type: :feature do
  include Devise::Test::IntegrationHelpers

  before :all do
    @user =  User.create(name: 'Gandalf', email: 'Gandy@email.com', password: 'GandyAlmighty')
  end

  before :each do
    sign_in @user
  end

  describe '#home' do
    before { visit authenticated_root_path }

    it { expect(page).to have_content('Products') }

    context 'button on click' do
      it 'should redirect me to Login page' do
        sign_in @user
        find_link('Add new product').click
        expect(current_path).to eq(new_product_path)
      end
    end
  end
end