require 'rails_helper'

RSpec.describe 'Auth API', type: :request do
  
  let!(:user) { create(:user) }
  let(:key) { SchoolProject::Application.config.secret_api_key }

  describe 'POST /api/v1/auth' do
    
    let(:valid_attributes) { { email: user.email, password: user.password, api_key: key } }

    context 'when the request is valid' do
      before { post '/api/v1/auth', params: valid_attributes }

      it 'authentication success' do
        expect(json['user']['name']).to eq user.name
        expect(json['user']['email']).to eq user.email
      end

      it 'returns status code 404' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/auth', params: { email: 'invalid@gmail.com', password: 'invalid', api_key: key } }

      it 'returns a validation failure message' do
        expect(response.body)
          .to match("\"error\":\"Email ou senha inválidos\",\"authorized\":\"false\"")
      end

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end

  end
  
end