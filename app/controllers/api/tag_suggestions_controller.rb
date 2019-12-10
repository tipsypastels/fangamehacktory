class Api::TagSuggestionsController < ApplicationController
  def show
    type = params[:type].classify

    unless type.in? Subjected.types.names
      render status: :unprocessable_entity and return
    end

    render json: type.constantize.suggested_tags
  end
end