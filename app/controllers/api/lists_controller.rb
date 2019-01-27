class ListsController < ApplicationController
  def index
    interaction.retrieve_lists

    render json: interaction.response, status: interaction.status
  end

  private

  def interaction
    @interaction ||= TrelloInteraction.new
  end
end