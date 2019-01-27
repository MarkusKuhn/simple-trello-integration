class TrelloListsSerializer
  def self.serialize_response(response)
    response_json = JSON.parse(response)
    response_json.map{ |record| process_record(record) }
  end

  def self.process_record(record)
    {
      id: record["id"],
      name: record["name"],
      closed: record["closed"],
      board_id: record["idBoard"],
      position: record["pos"],
      subscribed: record["subscribed"]
    }
  end
end