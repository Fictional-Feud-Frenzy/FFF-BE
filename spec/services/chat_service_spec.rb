require "rails_helper"

RSpec.describe "ChatGPT service" do
  it "#get_story", :vcr do
    character1 = "superman"
    character2 = "batman"

    chat_service = ChatService.new(character1, character2).get_story
    expect(chat_service).to be_a(Hash)
    expect(chat_service[:choices][0][:message][:content]).to be_a(String)
  end

  it "#get_norris_story", :vcr do
    character1 = "superman"
    character2 = "batman"

    chat_service = ChatService.new(character1, character2, mode: :norris).get_story
    expect(chat_service).to be_a(Hash)
    expect(chat_service[:choices][0][:message][:content]).to be_a(String)
  end
end