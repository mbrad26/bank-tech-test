class Account

  attr_reader :balance
  ERROR = 'Please make sure the amount is a positive number!'

  def initialize(transaction = Transaction, printer = Printer.new)
    @transaction = transaction
    @printer = printer
  end

  def deposit(amount)
    raise ERROR if amount < 0

    @transaction.add_to_transactions(amount, '')
  end

  def withdraw(amount)
    raise ERROR if amount < 0

    @transaction.add_to_transactions('', amount)
  end

  def statement
    puts @printer.print_statement
  end
end
