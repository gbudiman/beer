class Scrapper
  attr_accessor :access_token, :headers

  def initialize
    @access_token = HTTParty.get(
      url_for('generateToken'), 
      basic_auth: {
        username: ENV['USERNAME'],
        password: ENV['PASSWORD'],
      }
    ).parsed_response['access_token']

    @headers = { Authorization: "Bearer #{access_token}"}
  end

  def locations(filters:)
    paginate('locations', filters)
  end

  def branches(filters:)
    paginate('branches', filters)
  end

  def events(filters:)
    paginate('events', filters)
  end

  def url_for(action, page: 1)
    self.class.url_for(action, page: page)
  end

  def self.url_for(action, page: 1)
    [ENV['SERVER'], 'api', action].join('/') + "?page=#{page}"
  end

  private

  def paginate(action, filters)
    pages = nil
    # items = []
    # y = HTTParty.get(url_for(action), headers: headers).parsed_response
    # pagination_pages = y['pagination']['pages']
    # items.concat(funnel(y['items'], filters))

    y = (1..999).map do |page|
      next nil if pages.present? && page > pages

      res = HTTParty.get(url_for(action, page: page), headers: headers).parsed_response
      pages = res['pagination']['pages']
      funnel(res['items'], filters)
    end.compact.flatten

    byebug
    y
  end

  def funnel(items, filters)
    items.map { |x| x.map { |k, v| filters.include?(k) ? [k, v] : nil }.compact.to_h }
  end
end
