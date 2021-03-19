require 'rails_helper'

RSpec.describe 'Cards', type: :request do
  fixtures :cards

  subject { cards(:one) }

  describe 'GET /index' do
    it 'returns http success' do
      get collection_url
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get card_url(subject)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get new_card_url
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get edit_card_url(subject)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    it 'creates new card and redirects to #show' do
      post cards_url, params: {
        card: {
          front: 'City',
          back: 'Місто',
          category: 'Other'
        }
      }
      expect(response).to redirect_to(card_url(Card.last))
    end
  end

  describe 'PATCH /update' do
    it 'updates subject and redirects to #show' do
      patch card_url(subject), params: {
        card: {
          front: 'Updated',
          back: 'Оновлений',
          category: 'Other'
        }
      }
      expect(response).to redirect_to(subject)
    end
  end

  describe 'DELETE /destroy' do
    it 'deletes subject and redirects to #index' do
      expect { delete card_url(subject) }.to change { Card.count }.by(-1)
      expect(response).to redirect_to(cards_url)
    end
  end
end
