require 'rails_helper'

RSpec.describe 'Group view', type: :feature do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create(name: 'ooyytt', email: 'waleter@email.com', password: 'Almighty') }

  describe '#index' do
    before do
      sign_in user
      visit products_path
    end

    context 'when rendering index page' do
      it { expect(page).to have_content('Products') }
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
