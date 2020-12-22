require "pry"

class Transfer

  attr_accessor :sender, :receiver, :amount, :name, :status
  
  def initialize(sender, receiver, amount)
    @name = name
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true: false
    #binding.pry
  end


  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def execute_transaction
    if !valid? || self.status != "pending" || self.sender.balance <= amount
      reject_transfer
    else
      self.sender.balance -= amount
      self.receiver.balance += amount
      self.status = "complete"
    end  
    #binding.pry
  end

  def reverse_transfer
    if execute_transaction
      self.sender.balance += amount
      self.receiver.balance -= amount
      self.status = "reversed"
    end
  end

end
