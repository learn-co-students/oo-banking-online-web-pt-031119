require 'pry'

class Transfer
  attr_accessor :status # :sender, :receiver, :amount, :count
  attr_reader :sender, :receiver, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    sender.valid? && receiver.valid?
  end
  
  def execute_transaction
    if @sender.balance < @amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif
      @status == "complete"
      "Transaction was already executed."
    else
      sender.deposit(amount * (-1))
      receiver.deposit(amount)
      @status = "complete"
    end
    # binding.pry
  end
  
  def reverse_transfer
    if @status == "complete"
      @receiver.deposit(@amount * (-1))
      @sender.deposit(@amount)
      @status = "reversed"
    end
  end
  
end
