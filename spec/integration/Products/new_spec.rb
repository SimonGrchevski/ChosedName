require 'rails_helper'

RSpec.describe 'Products new', type: :feature do
  include Devise::Test::IntegrationHelpers

  before :all do
    @user = User.create(name: 'Gand', email: 'waleter@email.com', password: 'Almighty')
  end

  describe 'new' do
    before do
      sign_in @user
      visit new_product_path
    end

    it { expect(page).to have_content('New Product') }

    it 'should inputs' do
      %w[name amount].each do |type|
        expect(page).to have_selector("input[id=product_#{type}]")
      end
    end
  end
end
