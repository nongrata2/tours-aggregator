# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CitiesController, type: :controller do
  let!(:city1) { create(:city, sputnik_id: 1, name: 'Екатеринбург') }
  let!(:city2) { create(:city, sputnik_id: 2, name: 'Санкт-Петербург') }

  describe 'GET #index' do
    it 'assigns @cities and paginates results' do
      get :index, params: { sort_by: 'name' }
      expect(assigns(:cities)).to match_array([city1, city2])
      expect(assigns(:pagy)).to be_a(Pagy)
      expect(response).to have_http_status(:ok)
    end
  end
end
