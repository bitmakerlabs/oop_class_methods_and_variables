class Book
  @@on_shelf = []
  @@on_loan = []

  attr_accessor :due_date

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
  end

  def self.create(title, author, isbn)
    book = Book.new(title, author, isbn)
    @@on_shelf << book
    return book
  end

  def borrow
    if self.lent_out?
      return false
    else
      @@on_loan << self
      @@on_shelf.delete(self)
      @due_date = Book.current_due_date
      return true
    end
  end

  def self.current_due_date
    seconds_in_week = 60*60*24*7
    Time.now + seconds_in_week
  end

  def return_to_library
    if self.lent_out?
      @@on_loan.delete(self)
      @@on_shelf << self
      @due_date = nil
      return true
    else
      return false
    end
  end

  def lent_out?
    @@on_loan.include?(self)
  end

  def self.available
    return @@on_shelf
  end

  def self.borrowed
    return @@on_loan
  end

  def self.overdue
    overdue = []

    @@on_loan.each do |book|
      if book.due_date > Time.now
        overdue << book
      end
    end

    return overdue
  end

  def self.browse
    @@on_shelf.sample
  end

end

sister_outsider = Book.create("Sister Outsider", "Audre Lorde", "9781515905431")
aint_i = Book.create("Ain't I a Woman?", "Bell Hooks", "9780896081307")
if_they_come = Book.create("If They Come in the Morning", "Angela Y. Davis", "0893880221")
puts Book.browse.inspect
puts Book.browse.inspect
puts Book.browse.inspect
puts Book.available.inspect
puts Book.borrowed.inspect
puts sister_outsider.lent_out?
puts sister_outsider.borrow
puts sister_outsider.lent_out?
puts sister_outsider.borrow
puts sister_outsider.due_date
puts Book.available.inspect
puts Book.borrowed.inspect
puts Book.overdue.inspect
puts sister_outsider.return_to_library
puts sister_outsider.lent_out?
puts Book.available.inspect
puts Book.borrowed.inspect
