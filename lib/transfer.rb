require 'pry'
class Transfer
  attr_reader :sender, :receiver, :status, :amount
  attr_writer :status
  def initialize(sender,receiver, amount)
    #binding.pry
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @last_transaction = []
  end
  
  def valid?
    @sender.valid? && @receiver.valid? ? true : false
    
  end
  
  def execute_transaction
     if @status == "pending" && self.valid? && @sender.balance > amount
         @last_transaction =[@sender,@sender.balance,@receiver,@receiver.balance]
         @sender.balance -= @amount
         @receiver.balance += @amount
         @status = "complete"
         "Transaction rejected. Please check your account balance."
      else 
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
   end
  end
  
  def reverse_transfer
    if self.valid? && @receiver.balance > @amount && self.status == "complete"
      
      @receiver.balance -= amount
      @sender.balance += amount
      self.status = "reversed"
    end
    
  end
  
  
end
