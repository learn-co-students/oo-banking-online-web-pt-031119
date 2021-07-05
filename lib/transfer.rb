require 'pry'

class Transfer
  # your code here
  
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender =  sender 
    @receiver = receiver
    @status = "pending"
    @amount = amount
     #binding.pry 
  end 
  
  def valid? 
    @sender.valid? && @receiver.valid? ? true : false 
  end 
  
  def execute_transaction 
    if @sender.balance > @amount && @status == "pending"
      @sender.balance -= @amount 
      @receiver.balance += @amount
      @status = "complete"
      #binding.pry 
    else 
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end 
  
  def reverse_transfer 
    if @status == "complete"
      @sender.balance += @amount 
      @receiver.balance -= @amount 
      @status = "reversed"
      #binding.pry 
    end 
  end 
  
end
