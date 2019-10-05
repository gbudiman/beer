# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    render json: Event.filter(event_filter_params)
  end

  private

  def event_filter_params
    params.permit(:after, :before, branches: [])
  end
end
