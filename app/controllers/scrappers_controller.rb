# frozen_string_literal: true

class ScrappersController < ApplicationController
  def branches
    scrapper.branches(params[:page])
    render json: Branch.all
  end

  def locations
    scrapper.locations(params[:page])
    render json: Location.all
  end

  def events
    scrapper.events(params[:page])
    render json: Event.all
  end

  private

  def scrapper
    @scrapper ||= Scrapper.new
  end
end
