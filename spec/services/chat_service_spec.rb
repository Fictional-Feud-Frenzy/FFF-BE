require "rails_helper"

RSpec.describe "ChatGPT service" do
  it "#get_story", :vcr do
    character_1 = "superman"
    character_2 = "batman"

    chat_service = ChatService.get_story(character_1, character_2)
    expect(chat_service).to be_an(Hash)
  end

  it "#get_norris_story", :vcr do
    character_1 = "superman"
    character_2 = "batman"

    chat_service = ChatService.get_norris_story(character_1, character_2)
    expect(chat_service).to be_an(Hash)
  end
end