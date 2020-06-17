require 'transaction'
require 'timecop'

describe Transaction do
  subject { described_class }

  before :each do
    Timecop.freeze(Time.local(2020, 6, 16))
  end

  after :each do
    @@transactions = []
  end

  it 'instantiates with date, credit, debit and balance' do
    transaction = subject.new(10, '', 10)

    expect(transaction.date).to eq '2020-06-16'
    expect(transaction.credit).to eq 10
    expect(transaction.debit).to eq ''
    expect(transaction.balance).to eq 10
  end

  describe '.add_to_transactions' do
    it 'records the transactions' do
      subject.add_to_transactions(100, '')

      expect(subject.class_variable_get(:@@transactions)).to include instance_of subject
    end
  end

  describe '.transactions' do
    it 'returns all the transactions made by the account holder' do
      subject.add_to_transactions(250, '')
      subject.add_to_transactions('', 100)

      expect(subject.transactions.length).to eq 2
      expect(subject.transactions.all? { |t| t.instance_of? Transaction }).to eq true
    end
  end

  describe '.updated_balance' do
    context 'when making a deposit' do
      it 'updates the balance' do
        subject.add_to_transactions(100, '')

        expect(subject.transactions.last.balance).to eq 100
      end
    end

    context 'when making a withdrawal' do
      it 'updates the balance' do
        subject.add_to_transactions(100, '')
        subject.add_to_transactions('', 25)

        expect(subject.transactions.last.balance).to eq 75
      end
    end
  end
  
end
