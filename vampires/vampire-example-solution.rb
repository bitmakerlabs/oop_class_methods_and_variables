class Vampire
  @@coven = []

  attr_accessor :in_coffin, :drank_blood_today
  attr_reader :name, :age

  def initialize(name, age)
    @name = name
    @age = age
    @drank_blood_today = false
    @in_coffin = true
  end

  def self.create(name, age)
    new_vampire = Vampire.new(name, age)
    @@coven << new_vampire
    return new_vampire
  end

  def self.dawn

    @@coven.each do |vampire|
      if !vampire.in_coffin
        puts "#{vampire.name}, #{vampire.age} years old, perished in the sun"
      elsif !vampire.drank_blood_today
        puts "#{vampire.name}, #{vampire.age} years old, wasted away"
      end
    end

    @@coven.delete_if do |vampire|
      !vampire.drank_blood_today || !vampire.in_coffin
    end
  end

  def go_home
    @in_coffin = true
  end

  def drink_blood
    @drank_blood_today = true
  end

  def self.dusk
    @@coven.each do |vampire|
      vampire.drank_blood_today = false
      vampire.in_coffin = false
    end
  end
end

dracula = Vampire.create("Dracula", 900)
natalie = Vampire.create("Natalie", 26)
nas =Vampire.create("Nasferatu", 1000)
Vampire.dusk
dracula.drink_blood
nas.drink_blood
natalie.go_home
dracula.go_home
Vampire.dawn
