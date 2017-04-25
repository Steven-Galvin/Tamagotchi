require('sinatra')
require('sinatra/reloader')
also_reload("lib/**/*.rb")
require('./lib/tmgc')

get("/") do
  @tmgcs = Tamagotchi.all()
  Tamagotchi.time_check()
  # current_time = Time.new()
  # @tmgcs.each() do |tmgc|
  #   time_elapsed = current_time - tmgc[4]
  #   while time_elapsed > 60 do
  #     Tamagotchi.time_passes
  #     time_elapsed -= 60
  #   end
  #   tmgc[4] = Time.new()
  # end


  erb(:index)
end

post("/display") do
  name = params.fetch("name")
  Tamagotchi.new(name)
  erb(:display)
end
