class Transaction
  @@transactions = []
  attr_reader :date, :credit, :debit, :balance

  def initialize(credit, debit, balance)
    @date = Time.now.strftime("%Y-%m-%d")
    @credit = credit
    @debit = debit
    @balance = balance
  end

  def self.add_to_transactions(credit, debit, balance)
    @@transactions << Transaction.new(credit, debit, balance)
  end

  def self.transactions
    @@transactions
  end
end
