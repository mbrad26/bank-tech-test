class Account

  attr_reader :balance

  def initialize(transaction = Transaction)
    @balance = 0
    @transaction = transaction
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    raise 'Insufficient funds!' if balance < amount
    @balance -= amount
  end
end
