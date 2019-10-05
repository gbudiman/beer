class ScrappersController < ApplicationController
  def locations
    scrapper.locations(filters: %w[
      id
      name
      branch_id
      state
      address
    ])
  end

  def branches
    y = scrapper.branches(filters: %w[
      id
      name
      short_name
    ])

    byebug
  end

  def events
    scrapper.events(filters: %w[
      id
      name 
      branch_id
      start_date
      end_date
      location_id
    ])
  end

  private

  def scrapper
    @scrapper ||= Scrapper.new
  end
end
