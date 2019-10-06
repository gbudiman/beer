# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    render json: Event.filter(event_filter_params),
           include: {
             location: { only: %i[name address] },
             branch: { only: :name }
           },
           except: %i[created_at updated_at location_id end]
  end

  private

  def event_filter_params
    params.permit(:after, :before, branches: [])
  end
end
