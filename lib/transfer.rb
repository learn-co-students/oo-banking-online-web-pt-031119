class Transfer
  # your code here
  
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
   @sender = sender 
   @receiver = receiver
   @amount = amount
   @status = "pending"
  end
  
  def valid?
    sender.valid?
    receiver.valid?
  end
  
  def execute_transaction
    if sender.valid? && self.status == "pending" && sender.balance > amount
    @receiver.balance += amount
    @sender.balance -= amount
    self.status = "complete"
  else @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
  end
  
  def reverse_transfer
    if sender.valid? && self.status == "complete" && sender.balance > amount
    @receiver.balance -= amount
    @sender.balance += amount
    self.status = "reversed"
  else @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
  end
  
end
