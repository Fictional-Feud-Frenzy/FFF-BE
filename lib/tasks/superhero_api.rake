namespace :superhero do
  desc "Import data from external Superhero API"

  task import_from_api: :environment do
    require 'faraday'
    require 'faraday_middleware'
    require 'json'

    def calculate_weighted_average(data)
      intelligence_weight = (data['powerstats']['intelligence'].to_f * 0.10)
      speed_weight = (data['powerstats']['speed'].to_f * 0.20)
      strength_weight = (data['powerstats']['strength'].to_f * 0.15)
      power_weight = (data['powerstats']['power'].to_f * 0.15)
      durability_weight = (data['powerstats']['durability'].to_f * 0.20)
      combat_weight = (data['powerstats']['combat'].to_f * 0.20)

      weighted_average = intelligence_weight + strength_weight + speed_weight + durability_weight + power_weight + combat_weight
      weighted_average.floor
    end

    id = 1    

    loop do
      response = SuperheroService.get_superhero_data(id)

      if response.body['response'] == "success"
        data = response.body
        character = Character.find_or_initialize_by(id: data['id'])

        all_powerstats = [data['powerstats']['intelligence'],
                          data['powerstats']['strength'],
                          data['powerstats']['speed'],
                          data['powerstats']['durability'],
                          data['powerstats']['power'],
                          data['powerstats']['combat']]

        if all_powerstats.include?("null") || all_powerstats.include?("")
          id += 1
          next
        else
          character.intelligence = data['powerstats']['intelligence']
          character.strength = data['powerstats']['strength']
          character.speed = data['powerstats']['speed']
          character.durability = data['powerstats']['durability']
          character.power = data['powerstats']['power']
          character.combat = data['powerstats']['combat']
        end

        character.id = data['id']
        character.name = data['name']
        character.full_name = data['biography']['full-name']
        character.place_of_birth = data['biography']['place-of-birth']
        character.publisher = data['biography']['publisher']
        character.alignment = data['biography']['alignment']
        character.gender = data['appearance']['gender']
        character.race = data['appearance']['race']
        character.height = data['appearance']['height'][0]
        character.weight = data['appearance']['weight'][0]
        character.eye_color = data['appearance']['eye-color']
        character.hair_color = data['appearance']['hair-color']
        character.group_affiliation = data['connections']['group-affiliation']
        character.image = data['image']['url']
        character.power_stats_weighted_average = calculate_weighted_average(data)

        character.save
        id += 1
      else
        break
      end
    end
    puts "Data import complete!"
  end
end
