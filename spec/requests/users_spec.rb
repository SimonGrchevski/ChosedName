require 'rails_helper'

RSpec.describe 'Users', type: :request do
  include Devise::Test::IntegrationHelpers

  describe 'GET #home' do
    before { get unauthenticated_root_path }
    it 'must have response status ok' do
      expect(response).to have_http_status(:ok)
    end

    it "renders splash successfully" do
      expect(response).to render_template('splash')
    end
  end
end