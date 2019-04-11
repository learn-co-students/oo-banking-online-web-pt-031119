class BankAccount
attr_accessor  :balance, :status
attr_reader :name
def initialize(name)
  @name = name 
  @balance = 1000
  @status = "open"
end
def deposit(money_deposit)
  self.balance += money_deposit
end
def display_balance
  "Your balance is $#{balance}."
end
def valid?
  if balance > 0 
    @status == "open"
  else
    @status == "closed"
  end
end
def close_account
  self.status = "closed"
  
end

end
