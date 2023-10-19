require "rails_helper"

RSpec.describe "ChatGPT service" do
  it "#get_story", :vcr do
    character1 = "superman"
    character2 = "batman"

    chat_service = ChatService.get_story(character1, character2)
    expect(chat_service).to be_a(Hash)
  end

  it "#get_norris_story", :vcr do
    character1 = "superman"
    character2 = "batman"

    chat_service = ChatService.get_norris_story(character1, character2)
    expect(chat_service).to be_a(Hash)
  end
end