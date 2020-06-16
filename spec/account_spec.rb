require 'account'

describe Account do
  let(:subject) { described_class.new(transaction, printer)}
  let(:transaction) { class_double "Transaction" }
  let(:printer) { instance_double "Printer" }

  before :each do
    allow(transaction).to receive(:add_to_transactions)
  end

  it { is_expected.to respond_to(:deposit).with(1).argument }
  it { is_expected.to respond_to(:withdraw).with(1).argument }
  it { is_expected.to respond_to(:statement) }

  it 'has a balance of 0 by default' do
    expect(subject.balance).to eq 0
  end
  
  describe '#deposit' do
    it 'adds to the balance the amount provided as argument' do
      expect { subject.deposit(1000) }.to change(subject, :balance).by 1000
    end

    it 'creates a transaction' do
      expect(transaction).to receive(:add_to_transactions).with(1000, '', 1000)

      subject.deposit(1000)
    end

    context 'when amount is a negatavive number' do
      it 'raises an error' do
        error = 'You can not deposit a negative amount!'

        expect { subject.deposit(-100) }.to raise_error error
      end
    end
  end

  describe '#withdraw' do
    it 'deducts from the balance the amount provided as argument' do
      subject.deposit(1000)

      expect { subject.withdraw(500) }.to change(subject, :balance).by -500
    end

    it 'creates a transaction' do
      subject.deposit(1000)

      expect(transaction).to receive(:add_to_transactions).with('', 300, 700)

      subject.withdraw(300)
    end

    context 'when insufficient funds' do
      it 'raises an error' do
        error = 'Insufficient funds!'
        subject.deposit(500)

        expect { subject.withdraw(550) }.to raise_error error
      end
    end

    context 'when amount is a negatavive number' do
      it 'raises an error' do
        error = 'Please make sure the amount is a positive number!'

        expect { subject.withdraw(-100) }.to raise_error error
      end
    end
  end

  describe '#statement' do
    it 'returns a printed statement' do
      expect(printer).to receive(:print_statement)

      subject.statement
    end
  end
end
