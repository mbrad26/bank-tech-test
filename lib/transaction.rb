class Transaction
  @@transactions = []

  def initialize(credit, debit, balance)
  end

  def self.add_to_transactions(credit, debit, balance)
    @@transactions << Transaction.new(credit, debit, balance)
  end
end
