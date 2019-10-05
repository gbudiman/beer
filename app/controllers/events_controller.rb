# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    render json: Event.filter(event_filter_params), 
      include: { 
        location: { only: [:name, :address] },
        branch: { only: :name },
      },
      except: [:created_at, :updated_at, :branch_id, :location_id, :end]
  end

  private

  def event_filter_params
    params.permit(:after, :before, branches: [])
  end
end
