class Transfer
  
  attr_reader :sender, :receiver, :amount, :status
  
def initialize (sender, receiver, amount)
  @sender = sender
  @receiver = receiver
  @amount = amount
  @status = "pending"
  @counter = 0
end

def valid?
  if @sender.valid? == true && @receiver.valid? == true 
    true 
  else
    false 
  end
end

 def execute_transaction
   while @counter < 1 
   
   if @sender.balance > @amount && @sender.valid? == true 
     @sender.balance -= @amount
     @receiver.balance += @amount
     @status = "complete"
   else
     @status = "rejected"
     return "Transaction rejected. Please check your account balance."
   end
   @counter += 1
  end
end

def reverse_transfer
  if @status == "complete"
    @sender.balance += @amount
    @receiver.balance -= @amount
    @status = "reversed"
  end
end

end
