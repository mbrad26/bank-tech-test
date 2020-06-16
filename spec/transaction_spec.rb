require 'transaction.rb'

describe Transaction do
  subject { described_class }

  it 'instantiates with date, credit, debit and balance' do
    transaction = Transaction.new(10, '', 10)
    allow(Date.today).to receive(:to_s) {"2020-06-16"}

    expect(transaction.date).to eq "2020-06-16"
    expect(transaction.credit).to eq 10
    expect(transaction.debit).to eq ''
    expect(transaction.balance).to eq 10
  end

  describe '.add_to_transactions' do
    it 'records the transactions' do
      subject.add_to_transactions(100, '', 150)

      expect(subject.class_variable_get(:@@transactions)).to include instance_of subject
    end
  end

end
