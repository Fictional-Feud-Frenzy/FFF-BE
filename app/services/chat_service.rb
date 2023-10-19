class ChatService

  def self.get_story(character_1, character_2)
    payload = {
      model: "gpt-3.5-turbo",
      messages: [
        {
          role: "system",
          content: "You are a helpful assistant."
        },
        {
          role: "user",
          content: "#{character_1} beat #{character_2} in a fight.  Please give a short comic book story of how the battle went."
        }
      ]
    }.to_json
    get_url('/v1/chat/completions', payload)
  end

  def self.get_norris_story(character_1, character_2)
    payload = {
      model: "gpt-3.5-turbo",
      messages: [
        {
          role: "system",
          content: "You are a helpful assistant."
        },
        {
          role: "user",
          content: "#{character_1} ties #{character_2} in a fight but then Chuck Norris comes in and beats them both. Please give a short funny story with no dialogue or panels of how the battle went."
        }
      ]
    }.to_json
    get_url('/v1/chat/completions', payload)
  end

  def self.get_url(url, payload = nil)
    response = conn.post(url, payload)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.openai.com',
                headers: {
                  'Authorization' => "Bearer #{Rails.application.credentials.openapi[:api_key]}",
                  'Content-Type' => 'application/json'
                })
  end
end