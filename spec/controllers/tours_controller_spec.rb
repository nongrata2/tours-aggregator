# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe ToursController, type: :controller do
  let!(:city) { create(:city) }
  let!(:tour1) { create(:tour, title: 'Баня', sputnik_id: 1, city: city) }
  let!(:tour2) { create(:tour, title: 'Сауна', sputnik_id: 2, city: city) }

  describe 'GET #index' do
    it 'assigns @tours and paginates results' do
      get :index, params: { sort_by: 'duration asc' }
      expect(assigns(:tours)).to match_array([tour1, tour2])
      expect(assigns(:pagy)).to be_a(Pagy)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    context 'when tour is found' do
      it 'assigns @tour' do
        get :show, params: { sputnik_id: tour1.sputnik_id }
        expect(assigns(:tour)).to eq(tour1)
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when tour is not found' do
      it 'redirects to the cities path with an alert' do
        get :show, params: { sputnik_id: 999 }
        expect(response).to redirect_to(cities_path)
        expect(flash[:alert]).to eq('No such tour')
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
