require 'pry'

class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  def initialize(account_holder)
    @name = account_holder
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    self.balance += amount
    self.balance
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    self.status == "open" and self.balance > 0 ? true : false
  end

  def close_account
    self.status = "closed"
    self.status
  end
end
