require 'pry'
class Transfer

  attr_accessor :status, :amount, :sender, :receiver

  # youcan initialize a Transfer (FAILED - 1)
  def initialize(sender,receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid?
      if (sender.balance - amount) > 0
        return true
      end
    else
      return false
    end

  end

  def execute_transaction

    if valid? && self.status != "complete"
    sender.balance -= self.amount
    receiver.balance += self.amount
    self.status = "complete"
    else
    self.status = "rejected"
    return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
    receiver.balance -= @amount
    sender.balance += @amount
    self.status = "reversed"
   end
  end
end
