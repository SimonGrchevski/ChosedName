require 'rails_helper'

RSpec.describe 'MoneyTrack view', type: :feature do
  include Devise::Test::IntegrationHelpers

  before :all do
    @user =  User.create(name: 'Gandalf', email: 'Gandy@email.com', password: 'GandyAlmighty')
    @product = Product.create(name: 'unique', image: '', user_id: @user.id, amount:3)
  end

  describe '#index' do
    before do
      sign_in @user
      visit new_product_deal_path([:product_id =>@product.id])
    end

    it { expect(page).to have_content('new Transaction') }

    it 'should inputs' do
      %w[name quantity].each do |type|
        expect(page).to have_selector("input[id=deal_#{type}]")
      end
    end
  end
end