# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Watches', type: :request do
  describe 'GET /create' do
    it 'returns http success' do
      get '/watches/create'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      get '/watches/destroy'
      expect(response).to have_http_status(:success)
    end
  end
end
