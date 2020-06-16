class Account

  attr_reader :balance

  def initialize(transaction = Transaction)
    @balance = 0
    @transaction = transaction
  end

  def deposit(amount)
    raise 'You can not deposit a negative amount!' if amount < 0
    
    @balance += amount
    @transaction.add_to_transactions(amount, '', balance)
  end

  def withdraw(amount)
    raise 'Insufficient funds!' if balance < amount
    raise 'Please make sure the amount is a positive number!' if amount < 0

    @balance -= amount
    @transaction.add_to_transactions('', amount, balance)
  end
end
