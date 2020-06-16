class Printer

  def initialize(transaction = Transaction)
    @transaction = transaction
  end

  def print_statement
    header = "date || credit || debit || balance\n"
    @transaction.transactions.reverse.each do |transaction|
      date = transaction.date
      credit = '%.2f' % transaction.credit if transaction.credit != ''
      debit = '%.2f' % transaction.debit if transaction.debit != ''
      balance = '%.2f' % transaction.balance

      header += "#{date} || #{credit} || #{debit} || #{balance}\n"
    end

    header
  end
end
