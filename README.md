[![GitHub contributors](https://img.shields.io/github/contributors/ontrack-2305/ontrack_be)](https://github.com/ontrack-2305/ontrack_be/graphs/contributors)
[![GitHub forks](https://img.shields.io/github/forks/ontrack-2305/ontrack_be)](https://github.com/ontrack-2305/ontrack_be/forks)
[![GitHub Repo stars](https://img.shields.io/github/stars/ontrack-2305/ontrack_be)](https://github.com/ontrack-2305/ontrack_be/stargazers)
[![GitHub issues](https://img.shields.io/github/issues/ontrack-2305/ontrack_be)](https://github.com/ontrack-2305/ontrack_be/issues)

# OnTrack (Back end Repo)



## About This Project
### Important to Note
This is an SOA app and needs both this repo (back end) AND [![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white) ](FE REPO LINK GOES HERE - NO QUOTES) (front end) in order to be fully functioning.


### Overview
This project is built to satisfy the requirements of the Turing School of Software and Design's [Capstone Project](ADD TURING PROJECT LINK HERE WITH NO QUOTES). Students come up with their own idea for an application and build it as a group project. - MENTION FE AND BE COLLAB

ADD LOGO HERE
                    
## Purpose

The purpose of the backend for the FFF app is to support the overall functionality and effectiveness of the front end application. Here are some key purposes of the backend in relation to the project:

<b><u>Data management:</u></b> The backend serves as the central hub for storing, organizing, and managing the data associated with characters and. . . . .

<b><u>WHAT OTHER DATA/CONTENT ARE WE MANAGING? (EX. User-generated content management:)</u></b> The backend handles the CRUD functionality of tasks and ensures efficient data handling and metadata management. The backend enables users to manage their tasks and upload photos, enriching the platform's content and helping its users.

Overall, the purpose of the back end in the OnTrack app is to support seamless data management, photo management, and AI task prompts. It plays a vital role in ensuring the app's functionality, security, and user satisfaction, ultimately enhancing the daily lives of its users.

## Built With
* ![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white)
* ![Postgresql](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
* ![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
* ![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)
* ![Heroku](https://img.shields.io/badge/heroku-%23430098.svg?style=for-the-badge&logo=heroku&logoColor=white)
* ![Postman Badge](https://img.shields.io/badge/Postman-FF6C37?logo=postman&logoColor=fff&style=for-the-badge)
ADD GRAPHQL BADGE




## Running On
  - Rails 7.0.6
  - Ruby 3.2.2
  THESE CURRENT?

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
5. Get API keys from Google and OpenAI<br>
NEED AI? ANY OTHER KEYS?
[![OpenAI Badge](https://img.shields.io/badge/OpenAI-412991?logo=openai&logoColor=fff&style=for-the-badge)](https://platform.openai.com/)<br>

6. Add your keys to your credentials file like this:
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
    get 'api/v1/users/:user_id/tasks' - A user's task index 
    ADD OUR STUFF
    </code>
  </pre>
</div>

## Response
```
CHARACTER RESPONSE HASH HERE - (JSON CONTRACT)

CHUCK NORRIS RESPONSE STRING HERE

AI RESPONSE STRING HERE


```

## Schema
```
create_table "characters", force: :cascade do |t|
  t.string "name"
  FILL IN REST
```

## Contributing  [![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](LINK TO REPO ISSUES NOT AS A STRING)
Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

## Thoughts for future contributions:


If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

## API's Used
SUPERHERO BADGE<br>
CHUCK NORRIS BADGE<br>
OR LINKS IF NEED BE LIKE HOLIDAY BELOW
[![OpenAI Badge](https://img.shields.io/badge/OpenAI-412991?logo=openai&logoColor=fff&style=for-the-badge)](https://platform.openai.com/)<br>
Holidays API: "https://date.nager.atApi/v3/NextPublicHolidays/US"

## EQUITY ANALYSIS
(SOMETHING INSTEAD? OR JUST GET RID OF? EXPLAIN FE?)

## Security Considerations

**URL-Based Task Access:**


**Security Implication:**


**Mitigation Steps:**



## FFF TEAM


- Jeff Nelson [![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white) ](https://github.com/jpnelson85) [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white) ](https://www.linkedin.com/in/jeff-nelson-307aba45/)
- Christopher Cullinane [![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white) ](https://github.com/awiley33) [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white) ](https://www.linkedin.com/in/annawiley/)
- Dani Rae Wilson [![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white) ](https://github.com/dani-wilson) [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white) ](https://www.linkedin.com/in/daniraewilson/)
- Parker Boeing [![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white) ](https://github.com/ParkerBoeing) [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white) ](https://www.linkedin.com/in/parker-boeing/)
- Nick Sacco [![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white) ](https://github.com/sicknacco) [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white) ](https://www.linkedin.com/in/nick-sacco/)

## Planning Tools
- ![Miro Board](https://img.shields.io/badge/Miro-050038?style=for-the-badge&logo=Miro&logoColor=white)
- [![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white) ](LINK TO PROJECT BOARD HERE WITHOUT QUOTES)
- ![Slack](https://img.shields.io/badge/Slack-4A154B?style=for-the-badge&logo=slack&logoColor=white)