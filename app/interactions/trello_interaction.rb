class TrelloInteraction
  attr_accessor :status, :response

  def retrieve_lists
    process_get_request("https://api.trello.com/1/boards/#{board_id}/lists?key=#{api_key}&token=#{token}", TrelloListsSerializer)
  end

  def process_get_request(url, serializer)
    RestClient.get(url){ |response, request, result| handle_response(response, serializer) }
  end

  def handle_response(response, serializer)
    case response.code
    when 200
      @status = 200
      @response = serializer.serialize_response(response.body)
    else
      @status = response.code
      @resposne = { error: response.body }
    end
  end

  private

  def trello_credentials
    SimpleTrelloIntegration::Application.credentials.trello
  end

  def api_key
    trello_credentials[:api_key]
  end

  def token
    trello_credentials[:token]
  end

  def board_id
    trello_credentials[:board_id]
  end
end