require('sinatra')
require('sinatra/reloader')
also_reload("lib/**/*.rb")
require('./lib/tmgc')

get("/") do
  @tmgcs = Tamagotchi.all()
  Tamagotchi.time_check()
  erb(:index)
end

post("/display") do
  name = params.fetch("name")
  Tamagotchi.new(name)
  erb(:display)
end

get("/feed") do
  Tamagotchi.feed1()
  erb(:feed)
end

get("/nap") do
  Tamagotchi.nap1()
  erb(:nap)
end

get("/play") do
  Tamagotchi.play1()
  erb(:play)
end
