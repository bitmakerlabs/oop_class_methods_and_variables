
#### Before starting this assignment you should have some familiarity with
- arrays and iteration
- defining classes and instantiating objects
- defining and calling instance methods
- using instance variables

## Learning Goals
- class variables
- class methods

## Assignment
1. Create a class called `BankAccount`.
2. Add a _class variable_ called `@@interest_rate` that will be a float representing the interest rate for all the accounts in the bank.  This is a class variable because it is the same value for all accounts.
3. Add another class variable called `@@accounts` that starts as an empty array.  This will eventually store the list of all bank accounts in the bank.
3. Add an `initialize` instance method that sets `@balance` to zero.  You should also add an `attr_accessor` for `balance` to your class.  Balance is stored in an instance variable because the value needs to be different from account to account.
4. Add an instance method called `deposit` that accepts a number as an argument and adds that amount to the account's balance.  
  This needs to be an instance method because it pertains to a _single, specific account`.
5. Add an instance method called `withdraw` that accepts a number as an argument and subtracts that amount from the account's balance.
6. Add a _class method_ called `create` that calls `BankAccount.new` and adds the new object to `@@accounts` so that we can find it again in the future.  This method should return the new account object.
  This needs to be a class method because *at the time we run it* there is no _single, specific_ account object that we are working on.
7. Add a class method called `total_funds` that returns the sum of all balances across all accounts in `@@accounts`.  
  This needs to be a class method because it *does not* pertain to any _single, specific_ account.
8. Add a class method called `interest_time` that iterates through all accounts and increases their balances according to `@@interest_rate`.

### Example output

```
my_account = BankAccount.create
your_account = BankAccount.create
puts my_account.balance # 0
puts BankAccount.total_funds # 0
my_account.deposit(200)
your_account.deposit(1000)
puts my_account.balance # 200
puts your_account.balance # 1000
puts BankAccount.total_funds # 1200
BankAccount.interest_time
puts my_account.balance # 202.0
puts your_account.balance # 1010.0
puts BankAccount.total_funds # 1212.0
my_account.withdraw(50)
puts my_account.balance # 152.0
puts BankAccount.total_funds # 1162.0
```