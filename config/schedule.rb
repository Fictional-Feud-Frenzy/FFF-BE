
every '0 0 1 * *' do
  rake "superhero:import_from_api"
end