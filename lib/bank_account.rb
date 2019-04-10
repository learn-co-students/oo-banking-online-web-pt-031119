class BankAccount
  
  attr_accessor  :balance, :status, :new_balance
  attr_reader :name
  
  def initialize(name)
    @name = name 
    @balance = 1000 
    @status = "open"
  end 

  def deposit(total)
    @balance = @balance + total 
  end 
  
  def display_balance
    "Your balance is $#{@balance}."
  end 
  
  def valid?
    if @balance > 0 && @status == "open"
      true 
    else 
      false 
    end 
  end 
  
  def close_account 
    @status = "closed"
  end 

end
