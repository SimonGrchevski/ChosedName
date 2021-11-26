require 'rails_helper'

RSpec.describe 'Group view', type: :feature do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'ooyytt', email: 'waleter@email.com', password: 'Almighty') }

  describe '#index' do
    before do
      Product.create(name: 'eeeeww', image: '', user_id: user.id, amount:5)
      sign_in user
      visit products_path
      
    end

    context 'when rendering index page' do
      it {expect(page).to have_content('Products')}
      # it { expect(page).to have_content('ooyytt') }
      # it { expect(page).to have_content('5') }
    end

    context 'click on Add new product' do
      it 'should render to #new page' do
        sign_in user
        click_on 'Add new product'
        expect(current_path).to eq(new_product_path)
      end
    end
  end
end