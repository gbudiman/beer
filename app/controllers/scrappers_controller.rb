# frozen_string_literal: true

class ScrappersController < ApplicationController
  def locations
    scrapper.locations(page: params[:page], filters: %w[
                         id
                         name
                         branch_id
                         state
                         address
                       ]).map { |x| Location.upsert!(x) }

    render json: Location.all
  end

  def branches
    scrapper.branches(page: params[:page], filters: %w[
                        id
                        name
                        short_name
                      ]).map { |x| Branch.upsert!(x) }

    render json: Branch.all
  end

  def events
    scrapper.events(page: params[:page], filters: %w[
                      id
                      name
                      branch_id
                      start_date
                      end_date
                      location_id
                    ]).map { |x| Event.upsert!(x) }

    render json: Event.all
  end

  private

  def scrapper
    @scrapper ||= Scrapper.new
  end
end
