require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"

  end

  def valid?
    #binding.pry
    if sender.valid? && receiver.valid? == true
      true
    else
      false
    end

  end

  def execute_transaction
    #binding.pry
    if valid? == true && sender.balance > @amount && @status == "pending"
      sender.expense(@amount)
      receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end

  def reverse_transfer
    if @status == "complete"
      sender.deposit(@amount)
      receiver.expense(@amount)
      @status = "reversed"
    end

  end
     

  end
end
