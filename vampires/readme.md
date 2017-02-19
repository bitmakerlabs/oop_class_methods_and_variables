Now that you've had some experience using class variables and methods it's time to test your knowledge of _when_ to use them.

#### Before you start this assignment you should be familiar with:
- arrays and iteration
- if/else statements
- defining classes and instantiating objects
- defining and calling instance methods
- using instance variables
- defining and calling class methods

## Learning goals:
- when to use class variables
- when to use class methods vs. instance methods

## Vampires!
Your task is to create a `Vampire` class that stores a list of vampires (a coven, if you will).  Every vampire has a `name`, `age`, an `in_coffin` boolean, and a `drank_blood_today` boolean.

Every day at sunset the vampires leave their coffins in search of blood.  If they don't drink blood and get back to their coffins before sunrise, they die.

Your class should have the following methods:
- `initialize`, which creates a new vampire and assigns values for each of its attributes
- `create`, which creates a new vampire and adds it to the coven
- `drink_blood`, which sets a vampire's `drank_blood_today` boolean to true
- `sunrise`, which removes from the coven any vampires who are out of their coffins or who haven't drank any blood in the last day
- `sunset`, which sets `drank_blood_today` and `in_coffin` to false for the entire coven as they go out in search of blood
- `go_home`, which sets a vampire's `in_coffin` boolean to true

It's up to you to determine whether each method should be a class method or an instance method, as well as deciding what class and instance variables you need.

If you're not sure which kind of method to define, starting to write the body of the method may help you figure it out.  If you're still uncertain, don't be afraid to ask an instructor to help you work through the problem.

Good luck!