require 'rails_helper'

describe "patch a coffee route", :type => :request do
  let!(:coffee) {FactoryBot.create(:coffee)}
  
  context 'when successful' do
    before do
      patch "/coffees/#{coffee.id}", params: { blend_name: "Spicy Beans" }
      @response = JSON.parse(response.body)['coffee']
    end
    it 'returns the updated blend name' do
      expect(@response['blend_name']).to eq("Spicy Beans")
    end
  end

  context 'when not successful' do
    before do
      patch "/coffees/#{coffee.id}", params: { not_parameter: "Spicy Beans" }
      @response = JSON.parse(response.body)
    end

    it {
      byebug
      expect(@response).to have_http_status(404)
    }
  end

end
