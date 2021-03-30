require 'rails_helper'

describe "patch a coffee route", :type => :request do
  let!(:coffee) {FactoryBot.create(:coffee)}
  let!(:user) {FactoryBot.create(:user)}

  context 'when successful' do
    before do
      patch "/api/v1/coffees/#{coffee.id}", params: { blend_name: "Spicy Beans" }, headers: { "X-Api-Key" => user.api_key }
      @response = JSON.parse(response.body)['coffee']
    end
    it 'returns the updated blend name' do
      expect(@response['blend_name']).to eq("Spicy Beans")
    end
  end

  # context 'when not successful' do
  #   before do
  #     patch "/api/v1/coffees/#{coffee.id + 1}", headers: { "X-Api-Key" => user.api_key }
  #     @response = JSON.parse(response.body)
  #   end
  #   it {
  #     expect(@response).to have_http_status(404)
  #   }
  # end

end
