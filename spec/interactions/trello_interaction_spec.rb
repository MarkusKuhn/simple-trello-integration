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
      .to_return(body: { lists: []}.to_json)
  end

  describe '#retrieve_lists' do
    it 'retrieves all lists for the existing singular board' do
      expect(TrelloInteraction.retrieve_lists).to eq({"lists"=>[]})
    end
  end
end