class TrelloInteraction
  def self.retrieve_lists
    process_get_request("https://api.trello.com/1/boards/#{board_id}/lists?key=#{api_key}&token=#{token}")
  end

  def self.process_get_request(url)
    response = RestClient.get(url)
    JSON.parse(response)
  end

  private

  def self.trello_credentials
    SimpleTrelloIntegration::Application.credentials.trello
  end

  def self.api_key
    trello_credentials[:api_key]
  end

  def self.token
    trello_credentials[:token]
  end

  def self.board_id
    trello_credentials[:board_id]
  end
end