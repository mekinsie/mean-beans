require 'rails_helper'

describe 'post a coffee route', :type => :request do
  context 'when successful' do
    before do
      post '/coffees', params: { blend_name: 'Test Blend', origin: 'Test Origin', notes: 'Mmm, mmm, good'}
    end
    it 'returns the blend name' do
      expect(JSON.parse(response.body)["coffee"]['blend_name']).to eq('Test Blend')
    end

    it 'returns the origin' do
      expect(JSON.parse(response.body)["coffee"]['origin']).to eq('Test Origin')
    end

    it 'returns the notes' do
      expect(JSON.parse(response.body)["coffee"]['notes']).to eq('Mmm, mmm, good')
    end

    it 'returns a created status' do
      expect(response).to have_http_status(201)
    end
  end

  context 'when not successful' do
    before do
      post '/coffees', params: { blend_name: '', origin: 'Test Origin', notes: 'Mmm, mmm, good'}
    end
    it 'returns an unproccesable entity status' do
      expect(response).to have_http_status(422)
    end
  end
end
