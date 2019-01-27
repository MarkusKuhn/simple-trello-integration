require 'spec_helper'
require 'webmock/rspec'

describe Api::ListsController, type: :controller do
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
  end

    it "returs lists" do
      get :index
      expect(response.status).to eq 200
    end
  end
end