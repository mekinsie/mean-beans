require 'rails_helper'

describe "the coffees get requests" do
  let!(:coffees) { FactoryBot.create_list(:coffee, 20) }

  describe 'GET /coffees', :type => :request do
    context 'when successful' do
      before { get "/coffees" }

      it { expect(response).to have_http_status(200) }

      it 'returns all coffees' do
        expect(JSON.parse(response.body).count).to eq(coffees.count)
      end
    end
  end

  describe 'GET /coffees/:id', :type => :request do
    context 'when successful' do
      before { get "/coffees/#{coffees.first.id}" }

      it { expect(response).to have_http_status(200) }

      it 'returns a coffee based on id' do
        expect(JSON.parse(response.body)['blend_name']).to eq(coffees.first.blend_name)
      end
    end

    context 'when not successful' do
      before { get "/coffees/#{ coffees.last.id + 1 }" }
      it { expect(response).to have_http_status(404) }
    end
  end

end