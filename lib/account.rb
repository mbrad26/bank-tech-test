class Account

  attr_reader :balance

  def initialize(transaction = Transaction)
    @balance = 0
    @transaction = transaction
  end

  def deposit(amount)
    @balance += amount
    @transaction.add_to_transactions(credit: amount, balance: balance, type: :credit)
  end

  def withdraw(amount)
    raise 'Insufficient funds!' if balance < amount
    @balance -= amount
    @transaction.add_to_transactions(debit: amount, balance: balance, type: :debit)
  end
end
