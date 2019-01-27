require 'spec_helper'
require 'webmock/rspec'

describe Api::CardsController, type: :controller do
  describe "GET index" do
    before(:each) do
      stub_request(:get, "https://api.trello.com/1/boards/#{board_id}/lists?key=#{api_key}&token=#{token}")
        .to_return(body: [
          {"id"=>"5c4ddb3bc465ca23d9230371",
           "name"=>"To do",
           "closed"=>false,
           "idBoard"=>"5c4ddb3bbd37bc4ae45c375c",
           "pos"=>1,
           "subscribed"=>false}].to_json)
      stub_request(:post, "https://api.trello.com/1/cards?key=#{api_key}&token=#{token}")
  end

    it "returs lists" do
      post :create, params: { name: "Test" }
      expect(response.status).to eq 200
      expect(response.body).to eq "created"
    end
  end
end