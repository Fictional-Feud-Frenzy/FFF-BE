class JokeFacade
  def self.joke
    joke = NorrisService.random_joke
    joke[:result].sample[:value]
  end
end