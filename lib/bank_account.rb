class BankAccount
  attr_accessor :balance, :status
  attr_reader :name
  
  def initialize (name)
    @name = name 
    @balance = 1000 
    @status = 'open'
  end     #def 
  
  def deposit (amount)    
    @balance = @balance + amount
  end     #def 
  
  def display_balance 
    "Your balance is $#{@balance}."
  end     #def 
  
  def valid?
    if @status == 'open' && @balance > 0 
      true 
    else 
      false 
    end 
  end     #def 
  
  def close_account
    @status = 'closed'
  end     #def 
  
end
