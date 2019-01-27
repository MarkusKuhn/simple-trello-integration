class TrelloInteraction
  attr_accessor :status, :response

  def retrieve_lists
    process_get_request("https://api.trello.com/1/boards/#{board_id}/lists?key=#{api_key}&token=#{token}", TrelloListsSerializer)
  end

  def create_new_card(name)
    lists = retrieve_lists
    list = lists.select { |l| l[:name] == "To do" }.first
    process_post_request("https://api.trello.com/1/cards?key=#{api_key}&token=#{token}", { name: name, idList: list[:id] })
  end

  def process_get_request(url, serializer)
    RestClient.get(url){ |response, request, result| handle_response(response, serializer) }
  end

  def process_post_request(url, body)
    RestClient.post(url, body){ |response, request, result| handle_post_response(response) }
  end

  def handle_response(response, serializer)
    case response.code
    when 200
      @status = 200
      @response = serializer.serialize_response(response.body)
    else
      @status = response.code
      @response = { error: response.body }
    end
  end

  def handle_post_response(response)
    if response.code >= 200 && response.code < 300
      @status = 200
      @response = "created"
    else
      @status = response.code
      @response = { error: response.body }
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