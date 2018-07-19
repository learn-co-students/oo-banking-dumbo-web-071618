class Transfer
	# your code here

	attr_reader :sender,:receiver,:amount
	attr_accessor :status

	def initialize sender,receiver,amount
		@sender = sender
		@receiver = receiver
		@amount = amount		
		@status = "pending"
	end

	def valid?
		sender.valid? && receiver.valid?
	end

	def execute_transaction
		#check that the amount being transferred does not exceed the amount in each acct 
		if self.valid? && @status == "pending" && @sender.balance >= amount
			@sender.balance -= amount
			@receiver.deposit amount
			@status = "complete"
		else
			@status  = "rejected"
			"Transaction rejected. Please check your account balance."
		end
	end

	def reverse_transfer
		if @status == "complete"
			@receiver.balance -= amount
			@sender.deposit amount
			@status = "reversed"
		end
	end

end
