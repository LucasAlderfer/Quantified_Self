**This repository is for a project completed as a part of the Turing School of Software and Design's Backend Engineering Program**

*Quantified Self - Rails*

-The purpose of this project was to build a versioned API that could be used by a front end, while using a CI tool, in this case TravisCI, and maintaining readable and fully tested code to continue to practice the development of versioned APIs on Rails.

-This project is built in Rails 5.1.6 using Ruby 2.4.1, tested with 100% coverage with RSPEC reviewed by SimpleCov and build reviewed by TravisCI, using a Postgresql database.

- Quantified Self provides endpoints to:

  - See all foods in the database: get '/api/v1/foods'

  - See one specific food by id: get '/api/v1/foods/:id'

  - Create a new food in the database: post '/api/v1/foods'
    - Parameters will need to be passed in the format:
      { "food": { "name": "Name of food here", "calories": Calories here} }

  - Update an existing food in the database: patch '/api/v1/foods/:id'
    - Parameters will need to be passed in the format:
      { "food": { "name": "Mint", "calories": "14"} }

  - Delete and existing food in the database: delete '/api/v1/foods/:id'

  - See all meals in the database along with the foods associated with each meal: get '/api/v1/meals'

  - See one specific meal in the database by id: get '/api/v1/meals/:meal_id/foods'

  - Add a food to a specific meal: post '/api/v1/meals/:meal_id/foods/:id'
    - Parameters of both meal_id and id are required, id is the id of the food to be added
    - Successful addition of a food to a meal will display:
    {
      "message": "Successfully added FOODNAME to MEALNAME"
    }

  - Remove a food from a specific meal: delete '/api/v1/meals/:meal_id/foods/:id'
    - Successful removal of a food from a meal will display:
    {
      "message": "Successfully removed FOODNAME from MEALNAME"
    }

  - See the favorite foods in the database:
    - This metric is determined by the foods that have been included in the highest number of meals, returning all the foods at each of the highest 3 number of times that a food has been eaten, but only returning them if the number of times is higher than 1.
    - get '/api/v1/favorite_foods'

*To run Quantified Self - Rails for Yourself*
  - Clone down this repository
    - `git clone git@github.com:LucasAlderfer/Quantified_Self.git`

    - You will need to cd into the project

    - In the terminal, run `bundle install` and `bundle update`

    - In the terminal, run `rake db:{create,migrate}`

    - To run the testing suite, in the terminal, run `rspec`

    - To start a local server from which to view the backend locally, in the terminal, run `rails s`
