class ChatService
  def initialize(winner, loser, mode: :normal)
    @winner = winner
    @loser = loser
    @mode = mode
  end

  def get_story
    payload = {
      model: "gpt-3.5-turbo",
      messages: [
        {
          role: "system",
          content: "You are a helpful assistant."
        },
        {
          role: "user",
          content: user_content
        }
      ],
      temperature: 0.8,
      max_tokens: 300,
      top_p: 1,
      frequency_penalty: 0,
      presence_penalty: 0
    }
    get_url('chat/completions', payload)
  end

  private

  def user_content
    if @mode == :norris
      "using less than 300 tokens provide a brief summer of the battle between #{@winner} winning against #{@loser} in an epic battle, but then, out of nowhere, Chuck Norris descended from the heavens and defeated them both with a swift roundhouse kick. Please give a short funny story with no dialogue, panels, or markdown tags of how the battle went. The story should be less than 300 tokens and make sure the story is concise and makes sense."
    else
      "using less than 300 tokens provide a brief summer of the battle between #{@winner} winning against #{@loser} in an epic battle. Please give a short story with no dialogue, panels, or markdown tags of how the battle went.  The story should be less than 300 tokens and make sure the story is concise and makes sense."
    end
  end

  def get_url(endpoint, payload)
        response = conn.post(endpoint) do |req|
      req.body = JSON.dump(payload)
    end
    
    if response.success?
      JSON.parse(response.body, symbolize_names: true)
    else
      raise 'Failed to fetch story'
    end
  end

  def conn
    api_key = Rails.application.credentials.openapi[:api_key]

    @conn ||= Faraday.new('https://api.openai.com/v1/', ssl: { verify: true }) do |builder|
      builder.request :url_encoded
      builder.headers['Content-Type'] = 'application/json'
      builder.headers['Authorization'] = api_key
      builder.adapter Faraday.default_adapter
    end
  end
end
