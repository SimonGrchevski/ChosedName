require 'rails_helper'

RSpec.describe 'Deals', type: :request do
  include Devise::Test::IntegrationHelpers

  before :all do
    @user =  User.create(name: 'Gand', email: 'waleter@email.com', password: 'Almighty')
    @product = Product.create(name: 'unique', image: '', user_id: @user.id, amount:3)
  end

  before :each do
    sign_in @user
  end

  describe 'GET /new' do
    before { get new_product_deal_path([:product_id =>@product.id]) }

    it 'returns http succesex' do
      expect(response).to have_http_status(:success)
    end

    it "renders 'new' template" do
      expect(response).to render_template('new')
    end
  end
end