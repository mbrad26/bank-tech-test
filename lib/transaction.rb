class Transaction
  @@transactions = []
  attr_reader :date, :credit, :debit, :balance

  def initialize(credit, debit, balance)
    @date = Time.now.strftime("%Y-%m-%d")
    @balance = balance
    @credit = credit
    @debit = debit
  end

  private
  def self.add_to_transactions(credit, debit)
    @@transactions << self.new(credit, debit, self.updated_balance(credit))
  end

  def self.transactions
    @@transactions
  end

  def self.updated_balance(amount)
    balance = @@transactions.empty? ? amount : @@transactions.last.balance + amount
  end
end
