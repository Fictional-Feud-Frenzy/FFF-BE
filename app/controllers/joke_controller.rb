class JokeController < ApplicationController
  def index
    joke = JokeFacade.joke
    render json: joke
  end
end