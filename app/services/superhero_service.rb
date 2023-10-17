class SuperheroService

  def self.get_superhero_data(id)
    get_url("/api/10111528630893278/#{id}")
  end

  def self.get_url(url)
    response = conn.get(url)
    # puts "Raw Response: #{response.body}"
    # JSON.parse(response.body)
  end

  def self.conn
    Faraday.new("https://superheroapi.com") do |faraday|
    faraday.request :url_encoded
    faraday.response :json, content_type: /\bjson$/
    faraday.use FaradayMiddleware::FollowRedirects, limit: 5
    end
  end
end