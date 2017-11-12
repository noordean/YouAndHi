require 'rails_helper'

RSpec.describe 'YouAndHi API', type: :request do
  let!(:users) { create :user }
  let(:json) { JSON.parse(response.body) }

  describe 'GET /users' do
    before { get '/api/v1/users' }

    it 'returns users' do
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
      expect(json[0]["username"]).to eq('noordeaan')
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /users' do
    let(:valid_attributes) { {
      username: 'muinat',
      email: 'muinat@gmail.com',
      phone_number: '09089786543',
      password: 'ibro123' } }
    let(:invalid_attributes) { {
      username: 'muinat',
      email: 'muinatgmail.com',
      phone_number: '09089786543',
      password: 'ibro123'  } }

    context 'when the request is valid' do
      before { post '/api/v1/user/signup', params: valid_attributes }

      it 'creates a user' do
        expect(json["username"]).to eq('muinat')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  
    context 'when the request is invalid' do
      before { post '/api/v1/user/signup', params: invalid_attributes }

      it 'returns a validation failure message' do
        expect(response.body).to match('Email must be valid')
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end
end
