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
    amount = credit == '' ? -debit : credit
    @@transactions << self.new(credit, debit, self.updated_balance(amount))
  end

  def self.transactions
    @@transactions
  end

  def self.updated_balance(amount)
    raise 'Insufficient funds!' if self.sufficient_balance?(amount)

    self.transactions.empty? ? amount : self.transactions.last.balance + amount
  end

  def self.sufficient_balance?(amount)
    return amount < 0 if self.transactions == []
    self.transactions.last.balance + amount < 0 if self.transactions != []
  end
end
