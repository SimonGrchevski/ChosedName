require 'rails_helper'

RSpec.describe 'Products', type: :request do
  include Devise::Test::IntegrationHelpers

  before :all do
    @user = User.create(name: 'Gandalf', email: 'Gandy@email.com', password: 'GandyAlmighty')
  end

  before :each do
    sign_in @user
  end

  describe 'GET /new' do
    before do
      get new_product_path
    end

    it 'should have response status ok' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'new' template" do
      expect(response).to render_template('new')
    end
  end

  describe 'GET /index' do
    before do
      get products_path
    end
    it 'should have response status correct(ok)' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('/')
    end
  end
end
