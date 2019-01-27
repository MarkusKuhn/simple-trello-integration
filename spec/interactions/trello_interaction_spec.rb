require 'spec_helper'
require 'webmock/rspec'

def board_id
  SimpleTrelloIntegration::Application.credentials.trello[:board_id]
end

def token
  SimpleTrelloIntegration::Application.credentials.trello[:token]
end

def api_key
  SimpleTrelloIntegration::Application.credentials.trello[:api_key]
end

describe TrelloInteraction do
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

  describe '#retrieve_lists' do
    it 'retrieves all lists for the existing singular board' do
      interaction = TrelloInteraction.new
      interaction.retrieve_lists

      expect(interaction.status).to eq 200
      expect(interaction.response).to eq([{
        id: "5c4ddb3bc465ca23d9230371",
        name: "To do",
        closed: false,
        board_id: "5c4ddb3bbd37bc4ae45c375c",
        position: 1,
        subscribed: false
      }])
    end
  end
end