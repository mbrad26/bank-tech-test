class Account

  attr_reader :balance

  def initialize(transaction = Transaction, printer = Printer.new)
    # @balance = 0
    @transaction = transaction
    @printer = printer
  end

  def deposit(amount)
    raise 'You can not deposit a negative amount!' if amount < 0

    # @balance += amount
    @transaction.add_to_transactions(amount, '')
  end

  def withdraw(amount)
    # raise 'Insufficient funds!' if balance < amount
    raise 'Please make sure the amount is a positive number!' if amount < 0

    # @balance -= amount
    @transaction.add_to_transactions('', amount)
  end

  def statement
    puts @printer.print_statement
  end
end
