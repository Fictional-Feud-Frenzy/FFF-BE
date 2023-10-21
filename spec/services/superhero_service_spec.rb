require "rails_helper"

RSpec.describe SuperheroService do
  describe "#get_superhero_data" do
    it "returns superhero data", :vcr do
      response = SuperheroService.get_superhero_data(1)
      data = response.body

      expect(data).to be_a(Hash)
      expect(data).to have_key("response")
      expect(data["response"]).to be_a(String)
      expect(data).to have_key("id")
      expect(data["id"]).to be_a(String)
      expect(data).to have_key("name")
      expect(data["name"]).to be_a(String)

      expect(data).to have_key("powerstats")
      expect(data["powerstats"]).to be_a(Hash)
      expect(data["powerstats"]["intelligence"]).to be_a(String)
      expect(data["powerstats"]["strength"]).to be_a(String)
      expect(data["powerstats"]["speed"]).to be_a(String)
      expect(data["powerstats"]["durability"]).to be_a(String)
      expect(data["powerstats"]["power"]).to be_a(String)
      expect(data["powerstats"]["combat"]).to be_a(String)

      expect(data).to have_key("biography")
      expect(data["biography"]).to be_a(Hash)
      expect(data["biography"]["full-name"]).to be_a(String)
      expect(data["biography"]["place-of-birth"]).to be_a(String)
      expect(data["biography"]["publisher"]).to be_a(String)
      expect(data["biography"]["alignment"]).to be_a(String)

      expect(data).to have_key("appearance")
      expect(data["appearance"]).to be_a(Hash)
      expect(data["appearance"]["gender"]).to be_a(String)
      expect(data["appearance"]["race"]).to be_a(String)
      expect(data["appearance"]["height"]).to be_a(Array)
      expect(data["appearance"]["height"][0]).to be_a(String)
      expect(data["appearance"]["weight"]).to be_a(Array)
      expect(data["appearance"]["weight"][0]).to be_a(String)
      expect(data["appearance"]["eye-color"]).to be_a(String)
      expect(data["appearance"]["hair-color"]).to be_a(String)

      expect(data["connections"]).to be_a(Hash)
      expect(data["connections"]["group-affiliation"]).to be_a(String)

      expect(data["image"]).to be_a(Hash)
      expect(data["image"]["url"]).to be_a(String)
    end
  end
end