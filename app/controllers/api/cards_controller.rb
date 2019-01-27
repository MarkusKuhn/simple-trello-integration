class Api::CardsController < ApplicationController
  skip_before_action :verify_authenticity_token 

  def create
    interaction.create_new_card(card_params[:name])

    render json: interaction.response, status: interaction.status
  end

  private

  def card_params
    params.permit(:name)
  end

  def interaction
    @interaction ||= TrelloInteraction.new
  end
end