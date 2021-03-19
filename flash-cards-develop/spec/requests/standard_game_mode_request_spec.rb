require 'rails_helper'

RSpec.describe 'StandardGameModes', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get standard_game_mode_index_url, params: { category: 'Other' }
      expect(response).to have_http_status(:success)
    end
  end
end
