class TrelloWebhooksInteraction
  def initialize_webhooks
    response = RestClient.get("https://api.trello.com/1/tokens/#{token}/webhooks/?key=#{api_key}")
    webhooks = JSON.parse(response.body)
    if webhooks.any?
      reset_all_webhooks(webhooks)
    else
      create_new_webhook
    end
  end

  def reset_all_webhooks(webhooks)
    webhooks.each do |webhook|
      RestClient.delete("https://api.trello.com/1/webhooks/#{webhook['id']}?key=#{api_key}&token=#{token}")
    end

    create_new_webhook
  end

  def create_new_webhook
    lists = TrelloInteraction.new.retrieve_lists
    list = lists.select { |l| l[:name] == "To do" }.first

    RestClient.post("https://api.trello.com/1/tokens/#{token}/webhooks/?key=#{api_key}", {
      description: "Trello Integration Webhook",
      active: true,
      callbackURL:  callback_url,
      idModel: list[:id]
    })
  end

  private

  def trello_credentials
    SimpleTrelloIntegration::Application.credentials.trello
  end

  def callback_url
    "#{Rails.application.config.webhook_domain}/api/webhooks"
  end

  def api_key
    trello_credentials[:api_key]
  end

  def token
    trello_credentials[:token]
  end
end