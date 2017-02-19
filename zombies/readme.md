It's the zombie apocalypse!  But that doesn't mean we don't have time to practice using class variables and methods.

####  Before starting this assignment you should have some familiarity with:
- arrays and iteration
- if/else statements
- defining classes and instantiating objects
- instance variables
- defining and calling instance methods

## Learning goals:
- class variables
- class methods

## A side note on random numbers
We're going to be using Ruby's `rand` method to generate randomness in our game.  `rand` accepts one number as an argument and returns a random number that is less than that argument and greater than -1. So `rand(5)` would return a random number between 0 and 4, and `rand(10)` would return a number between 0 and 9.

Before you start writing your zombie program you should go into `irb` and try calling `rand` a handful of times in order to get comfortable with how it works.

## It's the zombie apocalypse
1. Create a class called Zombie.
2. Your class should have the following class variables:
  - `@@horde` should start as an empty array and will eventually contain the collection of all zombies.
  - `@@plague_level` should start at 10 and will be used to determine the rate at which new zombies are spawned.  This value will increase over time.
  - `@@max_speed` should be set to 5 and indicates the maximum value for the speed attribute of any zombie.  This value won't change.
  - `@@max_strength` should be set to 8 and indicates the maximum value for the strength attribute of any zombie.  This value won't change.
  - `@@default_speed` should be set to 1.  This value won't change.
  - `@@default_strength` should be set to 3.  This value won't change.
3. Your class should have the following methods:
  - an instance method `initialize`
  - an instance method `encounter`
  - an instance method `outrun_zombie?`
  - an instance method `survive_attack?`
  - a class method `all`
  - a class method `new_day`
  - a class method `some_die_off`
  - a class method `spawn`
  - a class method `increase_plague_level`

##### `initialize`
This instance method should take two integer arguments: one for the zombie's speed attribute and one for its strength.  If the speed argument is greater than `@@max_speed` then `@@default_speed` should be used as the new zombie's speed instead.  Similarly, you should check to make sure the strength argument is less than or equal to `@@max_strength`, otherwise `@@default_strength` should be used as the new zombie's strength attribute.

##### `all`
This class method should return the value of `@@horde`.

##### `spawn`
This class method should use `@@plague_level` to generate a random number and then create that number of new zombies, adding each one to `@@horde`.  Use `@@max_speed` and `@@max_strength` to generate random values for each new zombie's speed and strength.

##### `new_day`
This class method represents the events of yet another day of the zombie apocalypse.  Every day some zombies die off (phew!), some new ones show up, and sometimes the zombie plague level increases.  In order to accomplish this, `new_day` should call `some_die_off`, `spawn`, and `increase_plague_level`.

##### `increase_plague_level`
This class method should generate a random number between 0 and 2 and increase `@@plague_level` by that amount.

##### `some_die_off`
This class method should generate a random number between 0 and 10 and remove that number of zombies from `@@horde` (hint: you may want to check the `Array` docs for methods that could help you accomplish this).

##### `encounter`
This instance method represents you coming across a zombie! This can end in three possible outcomes: 1. escaping unscathed 2. being killed by the zombie 3. catching the plague and becoming a zombie yourself.

This method should call `outrun_zombie?` (see below) and `survive_attack?` (see also below) to determine which scenario applies. In the case that you are turned into a zombie (ie. you don't outrun the zombie but you aren't killed by it), create a new zombie object (that's you!) and add it to the `@@horde`.

In all three cases you should return a string that describes what happened to you in the encounter (eg. "You escaped!").


##### `outrun_zombie?`
This instance method should use `@@max_speed` to generate a random number that represents how fast you manage to run from this particular zombie.  This method should return `true` if your speed is greater than the zombie's and `false` otherwise.

##### `survive_attack?`
This instance method should use `@@max_strength` to generate a random number that represents how well you are able to fight off this zombie.  This method should return `true` if your speed is greater than the zombie's and `false` otherwise.

### Example output
Note: due to the random number generation in this program, keep in mind that your output will be different.
```
puts Zombie.all.inspect # []
Zombie.new_day
puts Zombie.all.inspect # [#<Zombie:0x005626ecc5ebd0 @speed=4, @strength=0>, #<Zombie:0x005626ecc5eba8 @speed=0, @strength=4>, #<Zombie:0x005626ecc5eb80 @speed=4, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter # You are now a zombie
puts zombie2.encounter # You died
puts zombie3.encounter # You died
Zombie.new_day
puts Zombie.all.inspect # [#<Zombie:0x005626ecc5e1f8 @speed=0, @strength=0>, #<Zombie:0x005626ecc5e180 @speed=3, @strength=3>, #<Zombie:0x005626ecc5e158 @speed=1, @strength=2>, #<Zombie:0x005626ecc5e090 @speed=0, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter # You got away
puts zombie2.encounter # You are now a zombie
puts zombie3.encounter # You died
```


## Stretch goals:
1. Change the `increase_plague_level` method so that the amount the plague level increases is somehow based on the number of zombies  in the horde, instead of being completely random.
2. Add a method called `deadliest_zombie` that returns the zombie that has the highest combination of speed and strength.  Should this be a class method or an instance method?