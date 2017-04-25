require('sinatra')
require('sinatra/reloader')
also_reload("lib/**/*.rb")
require('./lib/tmgc')

get("/") do
  @tmgcs = Tamagotchi.all()
  erb(:index)
end

post("/display") do
  name = params.fetch("name")
  Tamagotchi.new(name)
  erb(:display)
end
