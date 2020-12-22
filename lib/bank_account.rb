require "pry"

class BankAccount

  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def name
    @name
  end

  def balance
    @balance
  end

  def status
    @status
  end

  def deposit(amount)
    @balance = @balance + amount
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
   @balance > 0 && @status == "open" ? true: false
    #binding.pry
  end

  def close_account
    @status = "closed"
  end


end
