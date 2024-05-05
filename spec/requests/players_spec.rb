require 'rails_helper'

RSpec.describe 'Players', type: :request do

  describe 'GET /players' do
      let!(:players) { FactoryBot.create_list(:player, 10) }

      before { get '/players' }

      it "returns players" do
        # 10.times do
        #   Player.create(username: Faker::Internet.username)
        # end
        # FactoryBot.create_list(:player, 10)
        get players_path
        expect(response).to have_http_status(200)
        expect(json).not_to be_empty
        expect(json.size).to eq(10)
      end

      it 'returns players with the correct structure' do
        json.each do |player|
          expect(player).to include('username')
        end
      end

  end


  describe 'GET /players/:id' do
    let!(:player) { create(:player) }

    context 'when the player exists' do
      it 'returns the player' do
        get "/players/#{player.id}"
        expect(response).to have_http_status(200)
        expect(json['id']).to eq(player.id)
        expect(json['username']).to eq(player.username)
      end
    end

    context 'when the player does not exist' do
      it 'returns a not found error' do
        get '/players/999'
        expect(response).to have_http_status(:not_found)
      end
    end
  end


  describe "POST /players" do
    let (:valid_attributes) { { username: Faker::Internet.username } }

    before do
      post '/players', params: { player: valid_attributes }
    end

    context 'when the request is valid' do

      it 'creates a new player' do
        expect {
          post '/players', params: { player: {username: 'Alex'} }
        }.to change(Player, :count).by(1)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(:created)
      end

      it 'returns created player' do
        expect(json['username']).to eq(valid_attributes[:username])
      end

      it 'saves player with correct attributes' do
        player = Player.last
        expect(player).to be_present
        expect(player.username).to eq(valid_attributes[:username])
      end

    end
  end

  describe 'PUT /players/:id' do
    let!(:player) { create(:player) }
    let(:valid_attributes) { { username: 'Taylor' } }
    let(:invalid_attributes) { { username: '' } }

    context 'with valid parameters' do
      it 'updates the player' do
        put "/players/#{player.id}", params: { player: valid_attributes }
        player.reload
        expect(player.username).to eq('Taylor')
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid parameters' do
      it 'does not update the player' do
        put "/players/#{player.id}", params: { player: invalid_attributes }
        player.reload
        expect(player.username).not_to eq('')
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when the player does not exist' do
      it 'returns a not found error' do
        put '/players/999', params: { player: valid_attributes }
        expect(response).to have_http_status(:not_found)
      end
    end
  end


  describe 'DELETE /players/:id' do
    let!(:player) { create(:player) }

    context 'when the player exists' do
      it 'deletes the player' do
        expect {
          delete "/players/#{player.id}"
        }.to change(Player, :count).by(-1)

        expect(response).to have_http_status(:no_content)
      end
    end

    context 'when the player does not exist' do
      it 'returns a not found error' do
        delete '/players/999'
        expect(response).to have_http_status(:not_found)
      end
    end
  end


  def json
    JSON.parse(response.body)
  end


end
# context 'with valid attributes' do
#   it 'creates a new player and returns a success response' do
#     post '/players', params:  attributes_for(:player)
#     expect(response).to have_http_status(:created)
#     expect(Player.count).to eq(1)
#   end
# end

# context 'with invalid attributes' do
#   it 'does not create a new player and returns an error response' do
#     post '/players', params: attributes_for(:player, username: nil)
#     expect(response).to have_http_status(:unprocessable_entity)
#     expect(Player.count).to eq(0)
#   end
# end