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

  def locations(filters:, page:)
    paginate('locations', filters, page)
  end

  def branches(filters:, page:)
    paginate('branches', filters, page)
  end

  def events(filters:, page:)
    paginate('events', filters, page)
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
