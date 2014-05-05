require 'spec_helper'

describe Api::V1::WorldController do

  describe '.tiles' do
    context 'while signed in' do
      it 'calls .tiles_at' do
        user = FactoryGirl.create(:user)
        character = FactoryGirl.create(:character)
        tile = Tile.first
        character.tile = tile
        character.save!
        sign_in user

        Tile.should_receive(:tiles_at)
        post :tiles
        response.status.should eq 200
        response_json = JSON.parse(response.body)
        response_json.keys.should include("tiles")
        response_json.keys.should include("player_x")
        response_json.keys.should include("player_y")
        response_json.keys.should include("other_players")
        response_json.keys.should include("world_items")
      end
    end

    context 'while not signed in' do
      it 'renders {} with forbidden status' do
        post :tiles
        response.status.should eq 403
      end
    end
  end

end
