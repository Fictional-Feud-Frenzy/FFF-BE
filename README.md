[![GitHub contributors](https://img.shields.io/github/contributors/Fictional-Feud-Frenzy/FFF-BE)](https://github.com/Fictional-Feud-Frenzy/FFF-BE/graphs/contributors)
[![GitHub forks](https://img.shields.io/github/forks/Fictional-Feud-Frenzy/FFF-BE)](https://github.com/Fictional-Feud-Frenzy/FFF-BE/forks)
[![GitHub Repo stars](https://img.shields.io/github/stars/Fictional-Feud-Frenzy/FFF-BE)](https://github.com/Fictional-Feud-Frenzy/FFF-BE/stargazers)
[![GitHub issues](https://img.shields.io/github/issues/Fictional-Feud-Frenzy/FFF-BE)](https://github.com/Fictional-Feud-Frenzy/FFF-BE/issues)
![CircleCI](https://img.shields.io/circleci/build/github/Fictional-Feud-Frenzy/FFF-BE/main)

# Fictional-Feud-Frenzy (Back end Repo)



## About This Project
### Important to Note
This is an SOA app and needs both this repo (back end) AND [![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Fictional-Feud-Frenzy/FFF-FE) (front end) in order to be fully functioning.


### Overview
This project is built to satisfy the requirements of the Turing School of Software and Design's [Capstone Project](https://mod4.turing.edu/projects/capstone/). Students come up with their own idea for an application and build it as a group project. Front end students and Back end students work together to simulate working on a full stack team

<img src="app/assets/fff-logo-white.png">
                    
## Purpose

The purpose of the backend for the FFF app is to support the overall functionality and effectiveness of the front end application. Here are some key purposes of the back end in relation to the project:

<b><u>Data management:</u></b> The backend serves as the central hub for storing, organizing, and managing the data associated with characters and fight logic for the frontend

<b><u>Flexible Data Retrieval:</u></b> GraphQL allows the frontend to request exactly the data they need and nothing more

Overall, the purpose of the back end in the Fictional-Feud_Frenzy app is to support seamless data management and AI story prompts. It plays a vital role in ensuring the app's functionality and user satisfaction, ultimately enhancing the daily lives of its users.

## Built With
![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white)</br>
![Postgresql](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)</br>
![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white)</br>
![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)</br>
![Heroku](https://img.shields.io/badge/heroku-%23430098.svg?style=for-the-badge&logo=heroku&logoColor=white)</br>
![Postman Badge](https://img.shields.io/badge/Postman-FF6C37?logo=postman&logoColor=fff&style=for-the-badge)</br>
![GraphQL](https://img.shields.io/badge/-GraphQL-E10098?style=for-the-badge&logo=graphql&logoColor=white)</br>
![CircleCI](https://img.shields.io/badge/circle%20ci-%23161616.svg?style=for-the-badge&logo=circleci&logoColor=white)





## Running On
  - Rails 7.0.8
  - Ruby 3.2.2

## <b>Getting Started</b>

To get a local copy, follow these simple instructions

### <b>Installation</b>

1. Fork the Project
2. Clone the repo 
``` 
git clone git@github.com:your_username/Fictional-Feud-Frenzy/FFF-BE.git
```
3. Install the gems
```
bundle install
```
4. Create the database
```
rails db:{create,migrate}
```

5. Rake api data
```
rails superhero:import_from_api #be kind, limit 1.
```

6. Get API key from OpenAI<br>
[![OpenAI Badge](https://img.shields.io/badge/OpenAI-412991?logo=openai&logoColor=fff&style=for-the-badge)](https://platform.openai.com/)<br>

7. Add your keys to your credentials file like this:
```
- Run this command to open your credentials file:
  EDITOR="code --wait" bin/rails credentials:edit
  
- Add your API key to the credentials file, formatted something like this:
  openai:
    api_key: YOUR_API_KEY_HERE
  
- You can then call on this API key anytime like this!:
  Rails.application.credentials.openai[:api_key]
```
8. Create your Feature Branch 
```
git checkout -b feature/AmazingFeature
```
9. Commit your Changes 
```
git commit -m 'Add some AmazingFeature' 
```
10. Push to the Branch 
```
git push origin feature/AmazingFeature
```
11. Open a Pull Request

## Endpoints Used
<div style="overflow: auto; height: 200px;">
  <pre>
    <code>
    post "/graphql" - Only endpoint used because this application utilizes GraphQL
    </code>
  </pre>
</div>

## GraphQL Queries
<details>
<summary>Characters Query</summary>
  
```graphql
query characters {
  characters {
      id
      name
      intelligence
      strength
      speed
      durability
      power
      combat
      fullName
      publisher
      alignment
      image
      // any other character value could also be queried
  }
}
```
Expected Response:
```json
{"data"=>
  {"characters"=>
    [{"id"=>"583",
      "name"=>"Character 1",
      "intelligence"=>80,
      "strength"=>90,
      "speed"=>70,
      "durability"=>85,
      "power"=>75,
      "combat"=>88,
      "fullName"=>"Full Name 1",
      "publisher"=>"Publisher 1",
      "alignment"=>"Good",
      "image"=>"image_url_1"},
     {"id"=>"584",
      "name"=>"Character 2",
      "intelligence"=>85,
      "strength"=>92,
      "speed"=>75,
      "durability"=>80,
      "power"=>78,
      "combat"=>90,
      "fullName"=>"Full Name 2",
      "publisher"=>"Publisher 2",
      "alignment"=>"Evil",
      "image"=>"image_url_2"},
     {"id"=>"585",
      "name"=>"Character 3",
      "intelligence"=>88,
      "strength"=>87,
      "speed"=>78,
      "durability"=>89,
      "power"=>82,
      "combat"=>85,
      "fullName"=>"Full Name 3",
      "publisher"=>"Publisher 1",
      "alignment"=>"Neutral",
      "image"=>"image_url_3"},
      {...}
    ]
  }
}
```
</details>

<details>
<summary>Character Query</summary>
  
```graphql
  query Character($id: ID!) {
    character (id: $id) {
      id
      name
      intelligence
      strength
      speed
      durability
      power
      combat
      fullName
      placeOfBirth
      publisher
      alignment
      gender
      race
      height
      weight
      eyeColor
      hairColor
      groupAffiliation
      image
      powerStatsWeightedAverage
      // again, any character object value in the db is available
    }
  }
```
  
Expected Response:
```json
{"data"=>
  {"character"=>
    {"id"=>"591",
     "name"=>"Character 1",
     "intelligence"=>80,
     "strength"=>90,
     "speed"=>70,
     "durability"=>85,
     "power"=>75,
     "combat"=>88,
     "fullName"=>"Full Name 1",
     "placeOfBirth"=>"moon",
     "publisher"=>"Publisher 1",
     "alignment"=>"Good",
     "gender"=>"male",
     "race"=>"white",
     "height"=>"4'3",
     "weight"=>"105",
     "eyeColor"=>"blue",
     "hairColor"=>"brown",
     "groupAffiliation"=>"cool guys",
     "image"=>"image_url_1",
     "powerStatsWeightedAverage"=>80.0
    }
  }
}
```
</details>

<details>
<summary>Create Battle Mutation</summary>

```graphql
mutation ($character1: Int!, $character2: Int!){
  createBattle(character1: $character1, character2: $character2) {
    id
    character1 { // a character object
      id
    }
    character2 { // same
      id
    }
    winner { // also a character object
      id
      name
    }
    description
    // createdAt, updatedAt
  }
}
```

Expected Response:
```json
{"data"=>
  {"createBattle"=>
    {"id"=>"59",
     "character1"=>{"id"=>"592"},
     "character2"=>{"id"=>"593"},
     "winner"=>{"id"=>"592", "fullName"=>"Full Name 1"},
     "description"=>"In the realm of Hesperia, a land shrouded in mystery and magic, an epic battle unfolded between two formidable warriors..."
    }
  }
}
```
</details>

## Schema
```
create_table "characters", force: :cascade do |t|
  t.string "name"
  t.integer "intelligence"
  t.integer "strength"
  t.integer "speed"
  t.integer "durability"
  t.integer "power"
  t.integer "combat"
  t.string "full_name"
  t.string "place_of_birth"
  t.string "publisher"
  t.string "alignment"
  t.string "gender"
  t.string "race"
  t.string "height"
  t.string "weight"
  t.string "eye_color"
  t.string "hair_color"
  t.string "group_affiliation"
  t.string "image"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
  t.float "power_stats_weighted_average"
end

create_table "battles", force: :cascade do |t|
  t.bigint "character1_id", null: false
  t.bigint "character2_id", null: false
  t.bigint "winner_id", null: false
  t.text "description"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
  t.index ["character1_id"], name: "index_battles_on_character1_id"
  t.index ["character2_id"], name: "index_battles_on_character2_id"
  t.index ["winner_id"], name: "index_battles_on_winner_id"
end
```

## Contributing  [![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/Fictional-Feud-Frenzy/FFF-BE/issues)
Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

## Thoughts for future contributions:


If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

## API's Used
[![OpenAI Badge](https://img.shields.io/badge/OpenAI-412991?logo=openai&logoColor=fff&style=for-the-badge)](https://platform.openai.com/)<br>
Chuck Norris API: https://api.chucknorris.io </br>
Superhero API: https://superheroapi.com


## FFF TEAM


- Jeff Nelson [![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white) ](https://github.com/jpnelson85) [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white) ](https://www.linkedin.com/in/jeff-nelson-307aba45/)
- Christopher Cullinane [![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white) ](https://github.com/topher-nullset) [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white) ](https://www.linkedin.com/in/chris-cullinane-be/)
- Nick Sacco [![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white) ](https://github.com/sicknacco) [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white) ](https://www.linkedin.com/in/nick-sacco/)
- Bradley Milton [![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white) ](https://github.com/brad2412) [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white) ](https://www.linkedin.com/in/bradley-milton-01a814132/)
- Ben Holden [![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white) ](https://github.com/BenHolden010) [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white) ](https://www.linkedin.com/in/ben-holden-5115b8183)
- Denzel Turambi [![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white) ](https://github.com/Denzel-Turambi) [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white) ](https://www.linkedin.com/in/denzel-turambi-71a298267/)

## Planning Tools
![Miro Board](https://img.shields.io/badge/Miro-050038?style=for-the-badge&logo=Miro&logoColor=white)</br>
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white) ](https://github.com/orgs/Fictional-Feud-Frenzy/projects/1)</br>
![Slack](https://img.shields.io/badge/Slack-4A154B?style=for-the-badge&logo=slack&logoColor=white)
