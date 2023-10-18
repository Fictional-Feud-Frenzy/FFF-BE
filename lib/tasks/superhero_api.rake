namespace :superhero do
  desc "Import data from external Superhero API"

  task import_from_api: :environment do
    require 'faraday'
    require 'faraday_middleware'
    require 'json'

    character_id = 1

    loop do
        
        response = SuperheroService.get_superhero_data(character_id)
        if response.body['response'] == "success"
          data = response.body
          require 'pry'; binding.pry

          # rails db:{drop,create,migrate}

# Do we need to add id to the character schema?
          character = Character.find_by(id: data['id'])
          # character = Character.find_by(full_name: data['biography']['full-name'])

          if character == nil
            character = Character.new(data)
          else
            character.update(data)
          end
  
          character.save
          require 'pry'; binding.pry
          character_id += 1
        else
          break
        end
    end
    puts "Data import complete!"
  end
end

    # conn = Faraday.new(url: "https://superheroapi.com/api/10111528630893278/") do |faraday|
    #   faraday.request :url_encoded
    #   faraday.response :json, content_type: /\bjson$/
    #   faraday.use FaradayMiddleware::FollowRedirects, limit: 5
    # end
    # response = conn.get("#{id}")

        
#           if data['powerstats']['intelligence'] == "null" || data['powerstats']['intelligence'] == ""
#             id += 1
#             next
#           else
#             character.intelligence = data['powerstats']['intelligence']
#           end

#           if data['powerstats']['strength'] == "null" || data['powerstats']['strength'] == ""
#             id += 1
#             next
#           else
#             character.strength = data['powerstats']['strength']
#           end

#           if data['powerstats']['speed'] == "null" || data['powerstats']['speed'] == ""
#             id += 1
#             next
#           else
#             character.speed = data['powerstats']['speed']
#           end

#           if data['powerstats']['durability'] == "null" || data['powerstats']['durability'] == ""
#             id += 1
#             next
#           else
#             character.durability = data['powerstats']['durability']
#           end

#           if data['powerstats']['power'] == "null" || data['powerstats']['power'] == ""
#             id += 1
#             next
#           else
#             character.power = data['powerstats']['power']
#           end

#           if data['powerstats']['combat'] == "null" || data['powerstats']['combat'] == ""
#             id += 1
#             next
#           else
#             character.combat = data['powerstats']['combat']
#           end

#           character.id = data['id']
#           character.name = data['name']
#           character.full_name = data['biography']['full-name']
#           character.place_of_birth = data['biography']['place-of-birth']
#           character.publisher = data['biography']['publisher']
#           character.alignment = data['biography']['alignment']
#           character.gender = data['appearance']['gender']
#           character.race = data['appearance']['race']
#           character.height = data['appearance']['height'][0]
#           character.weight = data['appearance']['weight'][0]
#           character.eye_color = data['appearance']['eye-color']
#           character.hair_color = data['appearance']['hair-color']
#           character.group_affiliation = data['connections']['group-affiliation']
#           character.image = data['image']['url']

#           intelligence_weight = (data['powerstats']['intelligence'].to_f*0.10)
#           speed_weight = (data['powerstats']['speed'].to_f*0.20)
#           strength_weight = (data['powerstats']['strength'].to_f*0.15)
#           power_weight = (data['powerstats']['power'].to_f*0.15)
#           durability_weight = (data['powerstats']['durability'].to_f*0.20)
#           combat_weight = (data['powerstats']['combat'].to_f*0.20)
# require 'pry'; binding.pry
#           weighted_average = intelligence_weight + strength_weight + speed_weight+ durability_weight + power_weight + combat_weight
#           character.power_stats_weighted_average = weighted_average.floor
#       require 'pry'; binding.pry
          # character.save