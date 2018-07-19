class Transfer
  attr_accessor :receiver, :status, :amount
  attr_reader :sender
  attr_writer

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    receiver.valid? && sender.valid?
  end

  def execute_transaction
    if status != "complete" && self.valid? && sender.balance > amount
      sender.withdraw(amount)
      receiver.deposit(amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if status == "complete" && self.valid? && sender.balance > amount
      sender.deposit(amount)
      receiver.withdraw(amount)
      @status = "reversed"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

end
