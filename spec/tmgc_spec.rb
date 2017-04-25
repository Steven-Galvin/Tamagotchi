require('rspec')
require('tmgc')

describe(Tamagotchi) do
  describe("#initialize") do
    it("sets the name and life levels of a new Tamagotchi") do
      my_pet = Tamagotchi.new("lil dragon")
      expect(my_pet.name()).to(eq("lil dragon"))
      expect(my_pet.food_level()).to(eq(10))
      expect(my_pet.sleep_level()).to(eq(10))
      expect(my_pet.activity_level()).to(eq(10))
    end
  end

  describe("#is_alive?") do
    it("is alive if the food level is above 0") do
      my_pet = Tamagotchi.new("lil dragon")
      expect(my_pet.is_alive?()).to(eq(true))
    end

    it("is dead if the food level is 0") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.set_food_level(0) #make a method that will change the food level of your tamagotchi.
      expect(my_pet.is_alive?()).to(eq(false))
    end
  end

  describe(".time_passes") do
    it("decreases the amount of food the Tamagotchi has left by 1") do
      my_pet = Tamagotchi.new("lil dragon")
      Tamagotchi.time_passes()  #decide what trigger you will use to make time pass
      expect(my_pet.food_level()).to(eq(9))
    end

    it("decreases the activity and sleep level by 1") do
      my_pet = Tamagotchi.new("lil dragon")
      Tamagotchi.time_passes()  #decide what trigger you will use to make time pass
      expect(my_pet.sleep_level()).to(eq(9))
      expect(my_pet.activity_level()).to(eq(8))
    end

    it("will not revive Tamagotchi if food level is 0 and Tamagotchi is fed") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.set_food_level(0)
      my_pet.feed()
      expect(my_pet.is_alive?()).to(eq(false))
    end

    it("will not reduce any levels below 0") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.set_food_level(0)
      my_pet.set_sleep_level(0)
      my_pet.set_activity_level(0)
      Tamagotchi.time_passes
      expect(my_pet.food_level()).to(eq(0))
      expect(my_pet.sleep_level()).to(eq(0))
      expect(my_pet.activity_level()).to(eq(0))
    end
  # it("is alive if care mistakes are below 10") do
  #   my_pet = Tamagotchi.new("lil dragon")
  #   my_pet.care_mistake()
  #   expect(my_pet.is_alive()).to(eq())
  end
end
