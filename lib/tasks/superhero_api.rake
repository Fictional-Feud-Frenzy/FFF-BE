namespace :superhero do
  desc "Import data from external Superhero API"

  task import_from_api: :environment do
    require 'faraday'
    require 'faraday_middleware'
    require 'json'

    id = 1    

    loop do
      response = SuperheroService.get_superhero_data(id)

      if response.body['response'] == "success"
        data = response.body
        character = Character.find_or_initialize_by(id: data['id'])

        if character.powerstats_null(data)
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
        character.power_stats_weighted_average = character.calculate_weighted_average(data)

        character.save
        id += 1
      else
        break
      end
    end

    puts "Data import complete!"
  end
end
