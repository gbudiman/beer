# frozen_string_literal: true

class Scrapper
  attr_accessor :access_token, :headers

  def initialize
    @access_token = HTTParty.get(
      url_for('generateToken'),
      basic_auth: {
        username: ENV['USERNAME'],
        password: ENV['PASSWORD']
      }
    ).parsed_response['access_token']

    @headers = { Authorization: "Bearer #{access_token}" }
  end

  def run_all!
    branches
    locations
    events
  end

  def branches(page = nil)
    paginate(
      'branches',
      %w[id name short_name],
      page
    ).map { |x| Branch.upsert!(x) }
  end

  def locations(page = nil)
    paginate(
      'locations',
      %w[id name branch_id state address],
      page
    ).map { |x| Location.upsert!(x) }
  end

  def events(page = nil)
    paginate(
      'events',
      %w[id name branch_id start_date end_date location_id],
      page
    ).map { |x| Event.upsert!(x) }
  end

  def url_for(action, page: 1)
    self.class.url_for(action, page: page)
  end

  def self.url_for(action, page: 1)
    [ENV['SERVER'], 'api', action].join('/') + "?page=#{page}"
  end

  private

  def paginate(action, filters, selected_page)
    pages = nil
    page_range = selected_page.present? ? (selected_page..selected_page) : (1..999)

    page_range.map do |page|
      next nil if pages.present? && page > pages

      res = HTTParty.get(url_for(action, page: page), headers: headers).parsed_response
      pages = res['pagination']['pages']
      funnel(res['items'], filters)
    end.compact.flatten
  end

  def funnel(items, filters)
    items.map { |x| x.map { |k, v| filters.include?(k) ? [k, v] : nil }.compact.to_h }
  end
end
