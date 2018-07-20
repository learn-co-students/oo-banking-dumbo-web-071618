class Transfer

  attr_reader :transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    # @transfer
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if self.valid? == false
      "Transaction rejected. Please check your account balance."
      self.status = "rejected"
    else
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    end
  end

  def reverse_transfer
    sender.balance += amount
    receiver.balance -= amount
    transfer.status = "reversed"
  end

end
