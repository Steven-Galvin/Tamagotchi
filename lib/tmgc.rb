class Tamagotchi
  @@all_tmgcs = []

  define_method(:initialize) do |name|
    @name = name
    @food_level = 10
    @sleep_level = 10
    @activity_level = 10
    @timestamp = Time.new
    @tmgc_array = [@name, @food_level, @sleep_level, @activity_level, @timestamp]
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

  define_method(:sleep_level) do
    @tmgc_array[2]
  end

  define_method(:activity_level) do
    @tmgc_array[3]
  end

  define_method(:set_food_level) do |number|
    @tmgc_array[1] = number
  end

  define_method(:set_sleep_level) do |number|
    @tmgc_array[2] = number
  end

  define_method(:set_activity_level) do |number|
    @tmgc_array[3] = number
  end

  define_method(:feed) do
    if @tmgc_array[1] != 0
      @tmgc_array[1] = 10
    end
  end

  define_method(:nap) do
    @tmgc_array[2] = 10
  end

  define_method(:play) do
    @tmgc_array[3] = 10
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
      if tmgc[1] != 0
        tmgc[1] -= 1
      end
      if tmgc[2] != 0
        tmgc[2] -= 1
      end
      if tmgc[3] != 0
        tmgc[3] -= 2
      end
    end
  end

  define_singleton_method(:time_check) do
    current_time = Time.new()
    @@all_tmgcs.each() do |tmgc|
      time_elapsed = current_time - tmgc[4]
      while time_elapsed > 60 do
        Tamagotchi.time_passes
        time_elapsed -= 60
      end
      tmgc[4] = Time.new()
    end
  end
end
