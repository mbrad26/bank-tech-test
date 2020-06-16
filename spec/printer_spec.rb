require 'printer'

describe Printer do
  let(:subject) { described_class.new(transaction) }
  let(:transaction) { class_double "Transaction" }
  let(:first_transaction) { double 'transaction', date: '2020-06-16', credit: 150, debit: '', balance: 150}
  let(:second_transaction) { double 'transaction', date: '2020-06-16', credit: '', debit: 100, balance: 50}

  it { is_expected.to respond_to :print_statement }

  describe '#print_statement' do
    it 'prints the account statement' do
      allow(transaction).to receive(:transactions) { [first_transaction, second_transaction] }
      statement = "date || credit || debit || balance\n2020-06-16 ||  || 100.00 || 50.00\n2020-06-16 || 150.00 ||  || 150.00\n"

      expect(subject.print_statement).to eq statement
    end
  end
end
