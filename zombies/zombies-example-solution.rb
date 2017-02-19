class Zombie
  @@horde = []
  @@max_speed = 5
  @@max_strength = 5
  @@default_speed = 1
  @@default_strength = 1
  @@plague_level = 10

  def initialize(speed, strength)
    if speed > @@max_speed
      @speed = @@default_speed
    else
      @speed = speed
    end
    if strength > @@max_strength
      @strength = @@default_strength
    else
      @strength = strength
    end
  end

  def outrun_zombie?
    your_speed = rand(@@max_speed)
    return your_speed > @speed
  end

  def survive_attack?
    your_luck = rand(@@max_strength)
    return your_luck > @strength
  end

  def encounter
    if outrun_zombie?
      return "You got away"
    elsif survive_attack?
      your_zombie_speed = rand(@@max_speed)
      your_zombie_strength = rand(@@max_strength)
      @@horde << Zombie.new(your_zombie_speed, your_zombie_strength)

      return "You are now a zombie"
    else
      return "You died"
    end
  end


  def self.some_die_off
    how_many = rand(10)

    how_many.times do
      index = rand(@@horde.length)
      @@horde.delete_at(index)
    end
  end

  def self.new_day
    Zombie.some_die_off

    Zombie.spawn

    Zombie.increase_plague_level
  end

  def self.increase_plague_level
    @@plague_level += rand(2)
  end

  def self.spawn
    number_of_zombies = rand(@@plague_level)

    number_of_zombies.times do
      speed = rand(@@max_speed)
      strength = rand(@@max_strength)
      @@horde << Zombie.new(speed, strength)
    end
  end

  def self.all
    @@horde
  end
end

puts Zombie.all.inspect
Zombie.new_day
puts Zombie.all.inspect
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter
puts zombie2.encounter
puts zombie3.encounter
Zombie.new_day
puts Zombie.all.inspect
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter
puts zombie2.encounter
puts zombie3.encounter
