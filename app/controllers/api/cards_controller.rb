class Api::CardsController < ApplicationController
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