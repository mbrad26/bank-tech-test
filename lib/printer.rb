class Printer

  def initialize(transaction = Transaction)
    @transaction = transaction
  end

  def print_statement
    statement = print_header
    @transaction.transactions.reverse.each do |transaction|
      date = transaction.date
      credit = '%.2f' % transaction.credit if transaction.credit != ''
      debit = '%.2f' % transaction.debit if transaction.debit != ''
      balance = '%.2f' % transaction.balance

      statement += "#{date} || #{credit} || #{debit} || #{balance}\n"
    end

     statement
  end

  private
  def print_header
    "date || credit || debit || balance\n"
  end
end
