class Api::WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    head :ok
  end

  def receive
    card_name = webhook_params[:action][:data][:card][:name]
    new_list_name = webhook_params[:action][:data][:listAfter][:name]

    puts "Card '#{card_name}' moved to '#{new_list_name}'"
  end

  private

  def webhook_params
    params.require(:webhook).permit(action: [
      data: [
        card: [
          :name
        ],
        listAfter: [
          :name
        ]
      ]
    ])
  end
end