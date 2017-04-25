class Tamagotchi
  @@all_tmgcs = []

  define_method(:initialize) do |name|
    @name = name
    @food_level = 10
    @sleep_level = 10
    @activity_level = 10
    @tmgc_array = [@name, @food_level, @sleep_level, @activity_level]
    @@all_tmgcs.push(@tmgc_array)
  end

  define_method(:tmgc) do
    @tmgc_array
  end

  define_singleton_method(:all) do
    @@all_tmgcs
  end

  define_method(:name) do
    @tmgc_array[0]
  end

  define_method(:food_level) do
    @tmgc_array[1]
  end

  define_method(:set_food_level) do |number|
    @tmgc_array[1] = number
  end

  define_method(:feed) do
    @tmgc_array[1] = 10
  end

  define_method(:sleep_level) do
    @tmgc_array[2]
  end

  define_method(:activity_level) do
    @tmgc_array[3]
  end

  define_method(:is_alive?) do
    @tmgc_array[1] > 0
  end

  define_singleton_method(:time_passes) do
    @@all_tmgcs.each do |tmgc|
      tmgc[1] -= 1
      tmgc[2] -= 1
      tmgc[3] -= 2
      puts(tmgc)
    end
  end
end
