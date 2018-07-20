class BankAccount
  attr_reader :name, :display_balance
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
  end

  def deposit(money)
    @balance += money
  end

  def display_balance
   return "Your balance is $#{@balance}."
  end

  def valid?
    if @balance > 0 && @status == "open"
      return true
    else
      return false
    end
  end

  def close_account
    self.status = "closed"
  end
  
end
