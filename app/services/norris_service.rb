class NorrisService

  def self.random_joke
    get_url('/jokes/search?query=character')
  end

  private

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://api.chucknorris.io')
  end
end