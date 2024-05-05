require 'rails_helper'

RSpec.describe Player, type: :model do
    let(:valid_player) { create(:player) }

    it 'is valid with valid attributes' do
        expect(valid_player).to be_valid
    end

    it 'is not valid without a username' do
        player = Player.create(username: "")
        expect(player).to_not be_valid
        expect(player.errors[:username]).to include("can't be blank")
    end


    it 'must be unique' do
        player = Player.create(username: "Alex")
        player = Player.create(username: "Alex")
        expect(player).to_not be_valid
        expect(player.errors[:username]).to include("has already been taken")
    end


end
# it 'is valid with a username and password' do
#     player = build(:player)
#     expect(player).to be_valid
# end

# it 'is not valid without a username' do
#     player = build(:player, username: nil)
#     expect(player).not_to be_valid
# end

# it 'hashes the password' do
#     player = create(:player, password: 'password')
#     expect(player.password_digest).not_to eq 'password'
# end